# Restoring Database Backup

In case of any failure we need to restore the db dump.

To sync the backup folder in Amzon s3 Bucket:

######s3cmd sync s3://singaporeajabshaharbackup/backup_folder/  /home/ajabshahar/backup/

To sync s3  images folder with amazon ec2 /var/www/images folder:

######s3cmd sync s3://singaporeajabshaharbackup/ajabshahar_images/  /var/www/images

This is under sync_amazon_s3_bucket_with_ec2.sh. So just need to run this script.

Since database has been corrupted, drop the database “platform-dev”.

######drop database “platform-dev”

Now create  database “platform-dev”.

######create database “platform-dev”.

And grant all permissions to role “pg-dev” on database “platform-dev”.

######grant all privileges on database "platform-dev" to "pg-dev";

Now restore the database.

######psql "platform-dev" -U “postgres”< latestbackup.sql

All these steps are under backup_restore_script.sh.So in order to run this script we have to pass the full path for database backup file.This backup file will be under /home/ajabshahar/backup  folder.

We don’t need to restore the images. Since s3 images folder always be in sync with /var/www/images.

We can run the above two steps in a single script. That script is complete_backup_restore.sh. To run this script we have to pass parameter, that should be full path for database backup file. 















