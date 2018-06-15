sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nodejs npm
git clone https://github.com/jishi/node-sonos-http-api ~/node-sonos-http-api
cd ~/node-sonos-http-api
npm install --production
cd ~
bash -c "$(curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh)"

