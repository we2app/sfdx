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
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn && \
    yarn global add sfdx-cli


