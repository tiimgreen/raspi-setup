# updates
sudo apt-get update
sudo apt-get upgrade

# node-sonos-http-api
sudo apt-get install nodejs npm
git clone https://github.com/jishi/node-sonos-http-api ~/node-sonos-http-api
cd ~/node-sonos-http-api
npm install --production

# MagicMirror
cd ~
bash -c "$(curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh)"
git config --global user.email "tiimgreen@gmail.com"
git config --global user.name "Tim Green"
cd MagicMirror
git stash
git remote set-url origin https://github.com/tiimgreen/MagicMirror
git pull
cd modules
git clone https://github.com/tiimgreen/MMM-Football-Fixtures
git clone https://github.com/tiimgreen/MMM-cryptocurrency
git clone https://github.com/tiimgreen/MMM-Sonos-Control

# skywriter
cd ~
curl -sS get.pimoroni.com/skywriter | bash
git clone https://github.com/tiimgreen/mti
mv ~/mti/mti.py ~/Pimoroni/skywriter/examples/mti.py

# create pm2 files
touch mti.sh
chmod 777 mti.sh
echo "python3 ~/Pimoroni/skywriter/examples/mti.py" >> mti.sh
touch magic_mirror.sh
chmod 777 magic_mirror.sh
echo "cd MagicMirror" >> magic_mirror.sh
echo "DISPLAY=:0 npm start" >> magic_mirror.sh
touch node_sonos.sh
chmod 777 node_sonos.sh
echo "cd node-sonos-http-api" >> node_sonos.sh
echo "npm start" >> node_sonos.sh

# start pm2
pm2 start mti.sh
pm2 start magic_mirror.sh
pm2 start node_sonos.sh
pm2 save
