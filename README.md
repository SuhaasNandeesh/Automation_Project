# Automation_Project
Script automation to run check and upload apache server logs to AWS bucket
Below steps are performed in the automation script
1. Check for system updates
2. Check for installation of apache server, if not then installing the apache
3. After installation checking whether the apache is running or not
4. Enabling apache service so that apache restarts by itself when system reboots
5. Creating tar files for apache service logs
6. Uploading this tar files to S3 bucket
