sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nodejs npm
git clone https://github.com/jishi/node-sonos-http-api ~/node-sonos-http-api
cd ~/node-sonos-http-api
npm install --production
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
cd ~
git clone https://github.com/tiimgreen/skywriter.py
touch skywriter.sh
chmod 777 skywriter.sh
echo "cd skywriter.py" >> skywriter.sh
echo "python3 skywriter.py" >> skywriter.sh
touch magic_mirror.sh
chmod 777 magic_mirror.sh
echo "cd MagicMirror" >> magic_mirror.sh
echo "DISPLAY=:0 npm start" >> magic_mirror.sh
touch node_sonos.sh
chmod 777 node_sonos.sh
echo "cd node-sonos-http-api" >> node_sonos.sh
echo "npm start" >> node_sonos.sh
