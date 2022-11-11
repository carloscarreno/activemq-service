tar zxf apache-artemis-2.26.0-bin.tar.gz

mv apache-artemis-2.26.0 /opt/

addgroup --system activemq

adduser activemq

chown -R activemq:activemq /opt/apache-artemis-2.26.0

su activemq

cd /opt/apache-artemis-2.26.0/bin

# Creando el broker odin1
./artemis create odin1 --user=admin --password=admin --http-host 0.0.0.0 --relax-jolokia

# Ejecutando el broker odin1
/opt/apache-artemis-2.26.0/bin/odin1/bin/artemis run 

# Ejecutando como servicio
/opt/apache-artemis-2.26.0/bin/odin1/bin/artemis-service  start
/opt/apache-artemis-2.26.0/bin/odin1/bin/artemis-service  status
/opt/apache-artemis-2.26.0/bin/odin1/bin/artemis-service  restart

# Creando el daemon
sudo su
vi /etc/systemd/system/activemq.service

# [Unit]
# Description=Apache ActiveMQ Message Broker
# After=network-online.target

# [Service]
# Type=forking

# User=activemq
# Group=activemq

# WorkingDirectory=/opt/apache-artemis-2.26.0/bin/odin1/bin
# ExecStart=/opt/apache-artemis-2.26.0/bin/odin1/bin/artemis-service  start
# ExecStop=/opt/apache-artemis-2.26.0/bin/odin1/bin/artemis-service  stop
# Restart=on-abort


# [Install]
# WantedBy=multi-user.target

systemctl daemon-reload
systemctl start activemq.service
systemctl enable activemq.service
systemctl status activemq.service
