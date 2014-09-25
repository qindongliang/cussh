

if [  !  $# -eq 2  ] ; then
echo "请输入用户名和密码以空格分开!"
exit

else
name="$1"
passwd="$2"
fi


cat hosts | while read hosts
do



echo "正在$hosts上用户$name"
expect <<EOF
spawn   ssh $hosts "useradd $name; echo $name:$passwd | chpasswd" 
expect {
"*yes/no" {send "yes\r" ;exp_continue}
"*password:" {send "dongliang\r" ;exp_continue  }
}


EOF

echo  "成功建立"


done
