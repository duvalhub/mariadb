# Deploy a mariadb database


```bash
env="dev"
declare service_name="database_$env"
docker stop "$service_name"
docker run --detach --name "$service_name" \
    -p 3306:3306 \
    --env MYSQL_USER=$(pass "database/$env/user") \
    --env MYSQL_PASSWORD=$(pass "database/$env/password") \
    --env MYSQL_ROOT_PASSWORD=$(pass "database/$env/root")  \
    --network "database_$env" \
    -v database:/var/lib/mysql \
    -v database_ssl:/etc/my.cnf.d/certificates \
    mariadb:10.5 \
    --ssl_cert /etc/my.cnf.d/certificates/ca.crt \
    --ssl_key /etc/my.cnf.d/certificates/ca.key  \
    --ssl \
    --require_secure_transport
```