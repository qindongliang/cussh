

if [ ! $# -eq 2  ] ; then

echo "请输入用户名密码以空格分开"
exit
else

#用户的名字
uname="$1"
#用户的统一密码
pd="$2"
fi


#公钥无ssh认证模块
cat hosts | while read host
do



echo "当前正在向$host上传输ssh文件"
expect <<EOF
spawn  scp -r .ssh/  $host:/home/$uname 
expect {
"*yes/no" {send "yes\r" ;exp_continue}
"*password:" {send "$pd\r" ;exp_continue  }
}


EOF





echo "当前正在$host上进行公钥认证....."
sleep 2
expect <<EOF
spawn  ssh-copy-id  -i .ssh/id_rsa.pub $host 
expect {
"*yes/no" {send "yes\r" ;exp_continue}
"*password:" {send "$pd\r" ;exp_continue  }
}


EOF

echo "认证成功...."

done





