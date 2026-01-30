# ======================
# Stage 1: Build JAR
# ======================
FROM maven:3.9.2-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy Maven config first for caching dependencies
COPY pom.xml .

# Download dependencies (caching)
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the Spring Boot JAR (skip tests for faster build)
RUN mvn clean package -DskipTests

# ======================
# Stage 2: Run JAR
# ======================
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the built JAR from the previous stage
COPY --from=build /app/target/curiosity-box-0.0.1-SNAPSHOT.jar app.jar

# Expose the port Spring Boot runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
