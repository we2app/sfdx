FROM we2app/base

# Install Java 11
RUN apt-get update && \
    apt-get -y install openjdk-11-jdk-headless
    # apt-get install curl && \  
    # curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && \
    # source ~/.profile && \
    # nvm install 14.0.0 && \
    # npm install -g yarn && \
    # yarn global add sfdx-cli && \
    # apt-get clean && \
    # rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    # java -version && \
    # export JAVA_HOME=$(dirname $(dirname $(update-alternatives --list java))) && \
    # echo $JAVA_HOME && \
    # sfdx --version && \
    # node -v

# Install Node 14
RUN apt-get update && apt-get install -y curl gnupg2 lsb-release && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    apt-key fingerprint 1655A0AB68576280 && \
    export VERSION=node_14.x && \
    export DISTRO="$(lsb_release -s -c)" && \
    echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs && \
    node -v && npm -v && \
    npm install -g yarn && \
    yarn -v


