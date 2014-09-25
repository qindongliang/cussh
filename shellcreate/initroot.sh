
if [  ! $# -eq 2  ] ;then
echo "请输入用户密码以空格分开"
exit
else
#用户名
uname="$1"
#密码
passwd="$2"
fi


#执行检测并安装expect模块
ep=`rpm -qa | grep expect` 

if [ -z $ep   ] ; then
 echo "检测到你的系统，没有安装expect模块，准备执行安装"
 sleep 2
 yum install -y expect

else
 echo "已经安装expect模块，3秒后，开始执行ssh文件同步"
 sleep 3
fi



#公钥无ssh认证模块
cat hosts | while read host
do



echo "当前正在向$host上传输ssh文件"
expect <<EOF
spawn  scp -r .ssh/  $host:/$uname 
expect {
"*yes/no" {send "yes\r" ;exp_continue}
"*password:" {send "$passwd\r" ;exp_continue  }
}


EOF





echo "当前正在$host上进行公钥认证....."
sleep 2
expect <<EOF
spawn  ssh-copy-id  -i .ssh/id_rsa.pub $host 
expect {
"*yes/no" {send "yes\r" ;exp_continue}
"*password:" {send "$passwd\r" ;exp_continue  }
}


EOF

echo "认证成功...."

done




#切换root权限进行hosts文件分发



echo "同步本机的hosts文件到各个机器上"

sleep 1

#同步本机的hosts文件到其他各个机器上

cat hosts | while read host
do

scp -r /etc/hosts $host:/etc/


done


echo "同步hosts文件完毕"


















