# Linux daily task

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
