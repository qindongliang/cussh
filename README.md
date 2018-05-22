# cussh

###功能介绍
自动批量创建用户和配置SSH无密码登陆
脚本主要完成的功能：<br/>
1，自动化批量建立用户<br/>
2，自动化批量双向配置SSH认证<br/>
3，测试通过Centos6.5,其他系统大同小异，如报错，可改部分代码<br/>



###使用步骤:

1,配置集群的host文件，把所有机器的IP都写在hosts文件里，注意默认这几个文件解压在root根目录即可。

2，先在第一台root用户上执行 ssh-keygen -t rsa -P ''一路回车生成ssh文件

3，然后执行initroot.sh脚本，并传入root账号的用户名，密码，此脚本会首先检测系统是否安装过expect，如果没有
安装，则yum下载，如果安装过，则直接进行ssh文件拷贝，并执行公钥认证

4，执行cuser.sh脚本，并传入要建立用户的账号密码，就可以批量的在多个机器上建立用户了

5，然后拷贝root跟目下下的hosts文件和noroot.sh文件到上面建的用
户根目录下，并把权限改成用户权限
6，然后切入刚才建立的账户，同样执行第2个步骤生成ssh文件

7，最后执行noroot.sh文件，给刚才建的批量用户之间建立ssh双向无密码认证

8，至此完成，批量用户创建和SSH认证。

## 博客相关

（1）[微信公众号（woshigcs）：同步更新](https://github.com/qindongliang/answer_sheet_scan/blob/master/imgs/gcs.jpg)

（2）[个人站点(2018之后，同步更新）](http://8090nixi.com/) 

（3）[腾讯云社区，自动同步公众号文章](<http://qindongliang.iteye.com/>)

（4）[csdn ： (暂时同步更新)](https://blog.csdn.net/u010454030)

（5）[iteye（2018.05月之前所有的文章，之后弃用）](<http://qindongliang.iteye.com/>)  






## 我的公众号(woshigcs)

有问题可关注我的公众号留言咨询

![image](https://github.com/qindongliang/answer_sheet_scan/blob/master/imgs/gcs.jpg)
