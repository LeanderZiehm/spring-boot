# Stage 1: Build the app (with dependency caching)
FROM eclipse-temurin:21-jdk-alpine as build

WORKDIR /docker

# Copy only the necessary files to install dependencies and cache them
COPY mvnw mvnw
COPY .mvn .mvn
COPY pom.xml pom.xml

# Install dependencies and cache them (this step is cacheable)
RUN chmod +x mvnw \
    && ./mvnw dependency:go-offline

# Now copy the rest of the source code (this will invalidate cache only when the source changes)
COPY src src

# Build the project and package the app (skip tests here)
RUN ./mvnw clean package -DskipTests

# Stage 2: Create the runtime image (optimized and slim)
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /docker

# Only copy the built JAR from the previous stage
COPY --from=build /docker/target/one-0.0.1-SNAPSHOT.jar target/one-0.0.1-SNAPSHOT.jar

# Command to run the application
CMD ["java", "-jar", "target/one-0.0.1-SNAPSHOT.jar"]
