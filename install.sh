wget https://www.apache.org/dist/activemq/5.16.4/apache-activemq-5.16.4-bin.tar.gz

tar zxvf apache-activemq-5.16.4-bin.tar.gz

cd apache-activemq-5.16.4

useradd activemq

chown -R activemq:activemq /opt/apache-activemq-5.16.4

vi /etc/systemd/system/activemq.service

# [Unit]
# Description=Apache ActiveMQ Message Broker
# After=network-online.target

# [Service]
# Type=forking

# User=activemq
# Group=activemq

# WorkingDirectory=/opt/apache-activemq-5.16.4/bin
# ExecStart=/opt/apache-activemq-5.16.4/bin/activemq start
# ExecStop=/opt/apache-activemq-5.16.4/bin/activemq stop
# Restart=on-abort


# [Install]
# WantedBy=multi-user.target

systemctl daemon-reload
systemctl start activemq.service
systemctl enable activemq.service
systemctl status activemq.service

ss -ltpn 

firewall-cmd --zone=public --permanent --add-port=8161/tcp
firewall-cmd --reload

http://localhost:8161

http://localhost:8161/admin 

# Credenciales admin/admin

