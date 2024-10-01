# Use a lightweight image with Node.js
FROM node:14-slim

# Set environment variables
ENV APPIUM_VERSION=1.22.3

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    openjdk-11-jdk-headless \
    maven \
    && apt-get clean

# Install Appium
RUN npm install -g appium@${APPIUM_VERSION} --unsafe-perm=true --allow-root

# Install Appium Doctor (for checking dependencies)
RUN npm install -g appium-doctor

# Run Appium Doctor to check system requirements
RUN appium-doctor --android

# Expose the default Appium port
EXPOSE 4723

# Start the Appium server by default
CMD ["appium", "--log-level", "info"]
