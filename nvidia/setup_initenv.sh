echo "Update apt"
sudo apt update

echo "Install pip3 and docker."
sudo apt install pip3
sudo apt install docker

echo "Upgrade pip3"
pip3 install --upgrade pip

echo ""
sudo docker build ./ -t nvidia-cuda