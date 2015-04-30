pg_dump "platform-dev" -U "postgres" > /home/centos/backup_folder/ajabshahar_backup_$(date +"%A").sql
zip /home/centos/ajabshahr_images/"ajabshahar_images_$(date +"%A").zip" -j  /var/www/images/*