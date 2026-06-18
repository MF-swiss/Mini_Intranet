#!/bin/bash



services:

  wordpress:


  mediawiki:




  redmine:
    image: redmine:latest
    container_name: redmine
    ports:
      - "8080:3000"
    environment:
      REDMINE_DB_MYSQL: redmine-db
      REDMINE_DB_USERNAME: rmuser
      REDMINE_DB_PASSWORD: rmpass
      REDMINE_DB_DATABASE: redmine
    volumes:
      - mini_intranet_redmine_data:/usr/src/redmine/files
    depends_on:
      - redmine-db
    restart: always

  redmine-db:
    image: mariadb:11
    container_name: redmine-db
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: redmine
      MYSQL_USER: rmuser
      MYSQL_PASSWORD: rmpass
    volumes:
      - mini_intranet_redmine_db_data:/var/lib/mysql
    restart: always

  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    ports:
      - "9000:9000"
      - "9443:9443"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - mini_intranet_portainer_data:/data
    restart: always

volumes:


  mini_intranet_redmine_data:
  mini_intranet_redmine_db_data:
  mini_intranet_portainer_data:
EOF


echo "✅ Installation abgeschlossen!"
echo ""
echo "📌 Dienste erreichbar unter:"
echo "   WordPress:   
echo "   MediaWiki:   
echo "   Redmine:     http://localhost:8080"
echo "   Portainer:   http://localhost:9000"
