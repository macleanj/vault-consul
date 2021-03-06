vault write database/config/my-mariadb \
    plugin_name=mysql-database-plugin \
 connection_url="{{username}}:{{password}}@tcp(local.lab.crosslogic-consulting.com:3306)/" \
    allowed_roles="datareader,datawriter" \
    username="root" \
    password="mysql"

vault write database/roles/datareader \
    db_name=my-mariadb \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%';" \
    default_ttl="1h" \
    max_ttl="24h"

vault write database/roles/datawriter \
db_name=my-mariadb \
creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON *.* TO '{{name}}'@'%';" \
default_ttl="1h" \
max_ttl="24h"
