# Linux daily task

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


Md file reference: https://medium.com/@saumya.ranjan/how-to-write-a-readme-md-file-markdown-file-20cb7cbcd6f
