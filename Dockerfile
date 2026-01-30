# ======================
# Stage 1: Build JAR
# ======================
# Use Maven with Java 21
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

# Copy Maven config first so dependencies can be cached
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build the JAR
COPY src ./src
RUN mvn clean package -DskipTests -B

# ======================
# Stage 2: Run JAR
# ======================
# Use Java 21 runtime
FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY --from=build /app/target/CuriosityBox-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
