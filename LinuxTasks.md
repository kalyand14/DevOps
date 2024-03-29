
KodeKloud Task: https://www.kodekloud-engineer.com/#!/tasks

System List: https://kodekloudhub.github.io/kodekloud-engineer/docs/projects/nautilus

Architecture: https://lucid.app/lucidchart/58e22de2-c446-4b49-ae0f-db79a3318e97/view?page=0_0#



# Linux daily task

## 2022/04/08 - Create a Linux User with non-interactive shell

## 2022/04/09 -  setup NTP server

1. Installing NTP
   ```sudo yum update
   sudo yum install ntp
   sudo systemctl start ntpd
   sudo systemctl enable ntpd
   
   if firewall is configured then allow UDP traffic for NTP service to communicate to NTP pool
   
   sudo firewall-cmd --permanent --add-service=ntp
   sudo firewall-cmd --reload

3. Configuring NTP to Join the Pool \
    ```vi /etc/ntp.conf```
   
   Update the service list in the above file
   
    ```server ntp_server_hostname_1 iburst
    server ntp_server_hostname_2 iburst
    server ntp_server_hostname_3 iburst
    server ntp_server_hostname_4 iburst
    server ntp_server_hostname_5 iburst

5. Restart the NTP service \
   ```sudo systemctl restart ntpd```

#### Reference - https://www.digitalocean.com/community/tutorials/how-to-configure-ntp-for-use-in-the-ntp-pool-project-on-centos-7

## 2022/04/10 -  Find and replace all the occurence of a string in a file

```sed -i 's/old-text/new-text/g' input.txt```

#### Reference - https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/

## 2022/04/11 -  MairaDB Troubleshooting

```Job for mariadb.service failed because the control process exited with error code```

  Try to start the MariaDB services using below command but you will end up with above error \
    ```sudo systemctl start mariadb.service``` \
  Try to get the status of the MariaDB service and confirm the service is down \
    ```sudo systemctl status mariadb.service```
  
  #### Database data directory may be corrupted. To fix this follow the below step
  1. Navigate to below directory and remove all the files \
      ```cd /var/lib/mysql```
       ```rm -r *```
  2. Initialize the database directory \
     ```mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql```
  3. Start the db service \
      ```sudo systemctl start mysqld```
    
#### Reference - https://linuxways.net/centos/troubleshoot-error-job-for-mariadb-service-failed-because-the-control-process-exited-with-error-code/

## 2022/04/12 - How to do the SSH Authentication between linux server

  1. Create SSH key for current user from Jump server using below command \
    ```ssh-keygen -t rsa```
  2. Copy the public key from jump server to the target server \
    ```ssh-copy-id targetserveruser@192.168.0.11```
  3. Try to login into the target server without password \
    ```ssh targetserveruser@192.168.0.11```
    
#### Reference - https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/


## 2022/04/15 - You are not able to restart / start postfix and getting the below error 

```fatal: parameter inet_interfaces: no local interface found for ::1```

  1. Edit hosts file to disable the IPv6 on the server \
    ```Vi /etc/hosts```
  2. Comment the line start with \
    ```::1 ```


## 2022/04/17 - Create a user without home directory 

 1. To create users without their home directories, ‘-M‘ is used \
    ```useradd -M shilpi```
  2. Lets verify that the user is created without a home directoryh \
    ```ls -l /home/shilpi``` \
    ```ls: cannot access /home/shilpi: No such file or directory```
 
    
#### Reference - https://www.tecmint.com/add-users-in-linux/#:~:text=To%20add%2Fcreate%20a%20new,already%20exists%20on%20the%20system).

## 2022/04/19 - Update linux banner 

 /etc/motd - is the system file to show the banner

 1. Secure copy the banner into each server \
    ```sudo scp -r nautilus_banner tony@172.16.238.10:/home/tony```
     ```sudo scp -r nautilus_banner peter@172.16.238.10:/home/peter```
      ```sudo scp -r nautilus_banner steve@172.16.238.10:/home/steve```
      
Note: - SCP running on the device(jump server) is an SSH client application and the SCP server is a SSH server application. if could not able to do ssh then SCP server may not be installed on the target server.

 
  2. Deploy the banner into system file \
    ```sudo mv nautilus_banner /etc/motd``` \
    
#### Reference - https://www.shawonruet.com/2020/07/linux-banner-set-up-kodekloud.html

## 2022/04/23 - Create Users, Groups, Update directory permissions

### Create user

```useradd -c "wade Wilson" wwilson```
 
check user is created

 ```cat /etc/passwd```
 ```tail -n5 /etc/passwd```

### Create password

 ```tail -n5 /etc/shadow```
 ```passwd wwilson```

### Create group

 ```cat /etc/group```
 
 ```tail -n5 /etc/group```
 
 ```groupadd heros```
 
 ```groupadd villains```
 
 ### Add users to the group
 
 ```usermod -a -G heros wwilson```

```usermod -a -G villains vvdom```

```usermod -a -G villains vvdom```

### Create directory

Best place to create sharable folder is under /usr

```mkdir /usr/heros```

```mkdir /usr/villains```

### Change group of directory

```chgrp heros /usr/heros```

```chgrp villains /usr/villians```

### Update directory's group persmission

Give write permission to group

```chmod g+w /usr/heros```

```chmod g+w /usr/villains```

### Update directory's group permission to sticky

```chmod g+s /usr/heros```

```chmod g+s /usr/villains```

### Make directory world not readable

```chmod o-r /usr/heros```

```chmod o-r /usr/villains```

#### Reference - https://www.youtube.com/watch?v=Vjdyk8J4RLU
#### Reference - https://www.youtube.com/watch?v=KZSJH3_ubo4&t=912s


## 2022/04/25 - Disable root login

Below should not able allowed

```ssh root@192.168.0.102```

To disable root login, open the main ssh configuration file /etc/ssh/sshd_config with your choice of editor.

```sudo vi /etc/ssh/sshd_config```

Search for the following line in the file.

```#PermitRootLogin no```

Remove the ‘#‘ from the beginning of the line.  Make the line look similar to this.

```PermitRootLogin yes```

Restart the SSH daemon service.

```systemctl restart sshd```

#### Reference - https://www.tecmint.com/disable-or-enable-ssh-root-login-and-limit-ssh-access-in-linux/

## 2022/05/06 - Create cron job

a. Install cronie package on all Nautilus app servers and start crond service.

b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.

Do the below steps in all the app servers

Install cron service

```yum install cronie -y```

Start cron service

```systemctl start crond```

Update cron service to add the job for root user (root in the syntax is the key)

```crontab -e```

```cron */5 * * * * root echo hello > /tmp/cron_text```

Restart cron service

```systemctl restart crond```

List the cron service

```crontab -l```

Check whether the file is created by the cron job

```ll /tmp/```

#### Reference 1 - https://www.nbtechsupport.co.in/2020/12/a-cron-job-linux-server-kodekloud.html

#### Reference 2 https://www.freecodecamp.org/news/cron-jobs-in-linux/

## 2022/05/20 - Find all the files with extension css under /var/www/html/official and move to /official under root

```find /var/www/html/official -type f -name '*.css'  -exec cp --parents {} /official \;```


##

KodeKloud - https://www.shawonruet.com/search/label/operating_system?max-results=20

Md file reference: https://medium.com/@saumya.ranjan/how-to-write-a-readme-md-file-markdown-file-20cb7cbcd6f
