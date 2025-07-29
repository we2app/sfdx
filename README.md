# Base Image for Docker

This repository contains a Dockerfile for building a base image with the following features:

- **Java 21**: Installed using OpenJDK.
- **Node.js 22**: Installed using nvm (Node Version Manager).
- **Salesforce CLI**: Installed globally using npm.

## Instructions

1. Build the Docker image:
   ```
   docker build -t base-image .
   ```

2. Run the Docker container:
   ```
   docker run -it base-image
   ```

## Maintainer

For any issues or inquiries, contact: atik@we2app.com
