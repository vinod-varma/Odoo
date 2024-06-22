# Addons Directory Structure

## Create the directories for custom and enterprise addons if they don't exist:

mkdir -p /mnt/volume-bergjes/odoo_data_production

mkdir -p /mnt/volume-bergjes/odoo_backups_production

mkdir -p /mnt/volume-bergjes/odoo_import

mkdir -p /mnt/volume-bergjes/odoo_logs_production

mkdir -p /mnt/volume-bergjes/odoo_custom_addons_production

mkdir -p /mnt/volume-bergjes/odoo_enterprise_production

mkdir -p /mnt/volume-bergjes/db_data_production


`docker-compose up --build -d`

`docker-compose ps`


