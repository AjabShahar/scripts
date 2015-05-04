pg_dump "platform-dev" -U "postgres" > /home/centos/ajabshahar_backup_$(date +"%A").sql
zip /home/centos/"ajabshahar_images_$(date +"%A").zip" -j  /var/www/images/*
