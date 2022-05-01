echo "----Checking for updates----"
sudo apt update -y

if [ -n "$(apache2 -v)" ];
then
	echo "----Apache is installed----"
else
	echo "----Installing apache----"
	sudo apt -y install apache2
fi

echo "----Starting apache server----"
if [ -n "$(sudo systemctl status apache2.service)" ];
then 
	echo "----Apache service is running----"
else
	sudo systemctl start apache2
fi

echo "----Enabling apache server----"
if [ -n "$(sudo systemctl is-enabled apache2)" ];
then
	echo "----Apache is enabled for reboot----"
else
	sudo systemctl enable apache2
fi	

myname=suhaasnandeesh
timestamp=`date +%d%m%Y-%H%M%S`
s3_bucket=upgrad-suhaasnandeesh
log_type=httpd-logs
file_type=tar

tar -cvf $myname-httpd-logs-$timestamp.tar /var/log/apache2/*.log
mv *.tar /tmp

aws s3 cp /tmp/${myname}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar

