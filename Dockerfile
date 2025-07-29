FROM we2app/base


LABEL maintainer="atik@we2app.com" \
      org.label-schema.schema-version="1.1" \
      org.label-schema.name="Updated Base Image" \
      org.label-schema.description="Updated Base Image for all images - based on Ubuntu 20.04" 

# Install Java 21
RUN apt-get update && \
    apt-get -y install openjdk-21-jdk-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Node.js using nvm
RUN apt-get update && apt-get install -y curl && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && \
    . "$HOME/.nvm/nvm.sh" && \
    nvm install 22 && \
    . "$HOME/.nvm/nvm.sh" && \
    node -v && \
    nvm current && \
    npm -v 

# Install Salesforce CLI new @salesforce/cli
RUN apt-get update && \
    . "$HOME/.nvm/nvm.sh" && \
    # yarn global add sfdx-cli && \
    npm install @salesforce/cli --global && \
    sf -v 

# Consolidate cleanup commands
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Testing All Installed Versions
RUN . "$HOME/.nvm/nvm.sh" && \
    java -version && \
    javac -version && \
    node -v && \
    npm -v && \
    sf -v