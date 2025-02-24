# Install cqlsh
apk update && apk add --no-cache python3 py3-pip # Needed to run cqlsh bin
tar -xzvf cqlsh-5.1.34-bin.tar.gz
rm cqlsh-5.1.34-bin.tar.gz

# Install mongosh
apk add --update npm
apk add --update --no-cache mongodb-tools
npm install -g mongosh

# In a container environment, variables should be updated in the Dockerfile (command: ENV), otherwise changes applied in this script will not take effect
# The following commands are here primarily to not forget that the PATH variable should be updated.
export PATH=$PATH:/cqlsh-5.1.34/bin
export PATH=$PATH:/mongosh-2.3.3-linux-x64/bin