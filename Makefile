# Variables
# APP_NAME=one
# JAR=target/$(APP_NAME)-0.0.1-SNAPSHOT.jar
# PORT=8081


run:
	./mvnw package 
	./mvnw spring-boot:run


pod:
	podman build -t myapp:latest .
	podman run --name myapp-container myapp:latest


# # Default: run locally
# run: build
# 	@echo "Running $(APP_NAME)..."
# 	@java -jar $(JAR)

# # Build the JAR
# build:
# 	@echo "Building $(APP_NAME)..."
# 	@mvn clean package -DskipTests

# # Run in background
# run-bg: build
# 	@echo "Running $(APP_NAME) in background..."
# 	@nohup java -jar $(JAR) > app.log 2>&1 & echo $$! > app.pid
# 	@echo "App running, PID: $$(cat app.pid)"

# # Stop background process
# stop:
# 	@if [ -f app.pid ]; then \
# 		kill $$(cat app.pid); \
# 		rm -f app.pid; \
# 		echo "App stopped"; \
# 	else \
# 		echo "No app.pid found"; \
# 	fi

# Test GET endpoint
test-get:
	@curl -s http://localhost:$(PORT)/hello | tee /dev/tty

# Test POST endpoint
test-post:
	@curl -s -X POST http://localhost:$(PORT)/hello -H "Content-Type: text/plain" -d "ChatGPT" | tee /dev/tty

# # Clean
# clean:
# 	@mvn clean
