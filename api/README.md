# API

## Configuration

```bash
sudo apt-get update -y
sudo apt-get upgrade -y

# install tools
sudo apt-get install vim -y
sudo apt-get install git -y
sudo apt-get install tmux -y

# install node/npm/npx
sudo apt-get install snap -y
sudo apt-get install node-typescript -y
sudo snap install node --classic

ssh-keygen -t rsa -b 4096
# copy the public key to the github account
```

## Check instance accessibility from web

```bash
ip -c a # get the ip of the instance

# check the instance is accessible from the web
python3 -m http.server 8080 --bind $ip_of_instance
```

## Google application credentials

```bash
# copy the json file to the instance
export GOOGLE_APPLICATION_CREDENTIALS="/home/ubuntu/wallet-web-codelab/api/lvmh-project-411911-3fa1b9e130a9.json"
```

## Run

```bash
npm install
# don't to setup GOOGLE_APPLICATION_CREDENTIALS before running the server
npm run dev # demon mode
```
