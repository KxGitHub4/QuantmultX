# check socat
sct() {
    sct = 'dpkg -l | grep socat'
        if [ -z "$sct" ];then
            apt-get install socat -y
        else
            echo "next step"
                fi
}
# apply tls certification
tls() {
    sct
        curl  https://get.acme.sh | sh
        read -p "please input your domain: " dm
        ~/.acme.sh/acme.sh --issue -d $dm --standalone -k ec-256
        ~/.acme.sh/acme.sh --installcert -d $dm --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
}
# update
installF() {
        apt-get update -y
        apt-get install screen -y
}
# ready install 
read -p "Are you sure to install " ny
if [ $ny = "y" ];then
echo "which type you like to install
1.vmess
2.websocket
3.websocket+Tls"
read -p "123" nu
if [ -z "$nu" ];then
echo "please input number"
else 
case $nu in
1) 
installF
bash <(curl -L -s https://install.direct/go.sh)
;;
2)
installF
bash <(curl -L -s https://install.direct/go.sh)
;;
3)
installF 
bash <(curl -L -s https://install.direct/go.sh)
tls
;;
esac
fi
else
echo "hope see you next time"
fi
