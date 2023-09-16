# Use an official base image
FROM ubuntu:latest

# Install Clang-Format
RUN apt-get update && apt-get install -y clang-format

# Add a file that will contain your custom .clang-format settings
ADD .clang-format /.clang-format

# Create an entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make it executable
RUN chmod +x /entrypoint.sh

# Run the script when the container starts
ENTRYPOINT ["/entrypoint.sh"]
