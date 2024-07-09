# Base image
FROM golang:1.17-alpine

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the init script
COPY init_ulkeler.sh /app/init_ulkeler.sh

# Make the script executable
RUN chmod +x /app/init_ulkeler.sh

# Run the init script
RUN /bin/sh /app/init_ulkeler.sh

# Copy the Go application code
COPY . .

# Build the Go app
RUN go mod init example.com/myapp
RUN go mod tidy
RUN go build -o myapp .

# Expose port 5555 to the outside world
EXPOSE 5555

# Command to run the executable
CMD ["./myapp"]
