# CMUTEAM_NF_pipeline
CMUTEAM pipeline based on Nextflow and Docker container

# Install Docker
https://docs.docker.com/engine/install/ubuntu/

### 1. Set up the repository
Update the apt package index and install packages to allow apt to use a repository over HTTPS:
```
 sudo apt-get update
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

### 2. Add Docker’s official GPG key:
```
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

### 3. Use the following command to set up the stable repository. 
To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.
```
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
  
### 4. Install Docker Engine
Update the apt package index, and install the latest version of Docker Engine, containerd, and Docker Compose, or go to the next step to install a specific version:
```
 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

### 5. Allow Docker running without 'sudo'
https://docs.docker.com/engine/install/linux-postinstall/

We will create the docker group and add your user:

#### 5.1. Create the docker group.
```
 sudo groupadd docker
```
#### 5.2. Add your user to the docker group.
```
 sudo usermod -aG docker $USER
```
#### 5.3. Log out and log back in so that your group membership is re-evaluated.

If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect.

On a desktop Linux environment such as X Windows, log out of your session completely and then log back in.

On Linux, you can also run the following command to activate the changes to groups:
```
 newgrp docker 
```
#### 5.4. Verify that you can run docker commands without sudo.
```
 docker run hello-world
```

