# mariadb-ariadb

<p>
  <img src="https://img.shields.io/badge/MariaDB-10.4.15-brightgreen?style=for-the-badge">
  <a href="https://hub.docker.com/repository/docker/peganet/mariadb-aria">
    <img src="https://img.shields.io/docker/image-size/peganet/mariadb-aria/latest?style=for-the-badge">
  </a>
  <a href="https://hub.docker.com/repository/docker/peganet/mariadb-aria">
    <img src="https://img.shields.io/docker/pulls/peganet/mariadb-aria?style=for-the-badge">
  </a>
</p>


This is a simple extension of [yobasystems/alpine-mariadb](https://hub.docker.com/r/yobasystems/alpine-mariadb)
image that forces `aria` storage engine by default.

It supports [the same configuration options](https://hub.docker.com/r/yobasystems/alpine-mariadb) as the source image.

### Docker Secrets
This image supports the use of Docker secrets to import from file and keep sensitive usernames or passwords from being passed or preserved in plaintext.

You can set any environment variable from a file by appending `__FILE` (double-underscore FILE) to the environmental variable name.

```yml
version: '3.7'

secrets:
  # Secrets are single-line text files where the sole content is the secret
  # Paths in this example assume that secrets are kept in local folder called ".secrets"
  DB_ROOT_PWD:
    file: .secrets/db_root_pwd.txt
  MYSQL_PWD:
    file: .secrets/mysql_pwd.txt

services
  mariadb:
    image: peganet/mariadb-aria
    container_name: mariadb
    secrets:
      - DB_ROOT_PWD
      - MYSQL_PWD
    environment:
      # MYSQL_ROOT_PASSWORD: "npm"  # use secret instead
      MYSQL_ROOT_PASSWORD__FILE: /run/secrets/DB_ROOT_PWD
      MYSQL_DATABASE: "npm"
      MYSQL_USER: "npm"
      # MYSQL_PASSWORD: "npm"  # use secret instead
      MYSQL_PASSWORD__FILE: /run/secrets/MYSQL_PWD 
    volumes:
      - ./data/mysql:/var/lib/mysql
```


[View on DockerHub](https://hub.docker.com/repository/docker/peganet/mariadb-aria)
