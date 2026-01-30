# ======================
# Stage 1: Build JAR
# ======================
# Use Maven with Java 21
FROM maven:3.9.2-jdk-21 AS build

WORKDIR /app

# Copy Maven config first for caching dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build the JAR
COPY src ./src
RUN mvn clean package -DskipTests

# ======================
# Stage 2: Run JAR
# ======================
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/CuriosityBox-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
