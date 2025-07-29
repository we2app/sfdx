FROM we2app/base

# Install Java 21
RUN apt-get update && \
    apt-get -y install openjdk-21-jdk-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Node 14
RUN apt-get update && apt-get install -y curl gnupg2 lsb-release && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    apt-key fingerprint 1655A0AB68576280 && \
    export VERSION=node_22.x && \
    export DISTRO="$(lsb_release -s -c)" && \
    echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs && \
    node -v && npm -v && \
    npm install -g yarn && \
    yarn -v && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Salesforce CLI new @salesforce/cli
RUN apt-get update && \
    # yarn global add sfdx-cli && \
    npm install @salesforce/cli --global && \
    sf -v && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Testing All Installed Versions
RUN java -version && \
    javac -version && \
    node -v && \
    npm -v && \
    yarn -v && \
    sf -v