#!/bin/bash

/sbin/ifconfig eth0 txqueuelen 10000

ethtool -G eth0 rx 8192 tx 8192

echo "net.core.netdev_budget = 50000" >> /etc/sysctl.conf
echo "net.core.netdev_budget_usecs = 5000" >> /etc/sysctl.conf
echo "net.core.netdev_max_backlog=250000" >> /etc/sysctl.conf
echo "net.core.somaxconn = 1024" >> /etc/sysctl.conf
echo "net.core.rmem_max=536870912" >> /etc/sysctl.conf
echo "net.core.rmem_default=1048576" >> /etc/sysctl.conf
echo "net.core.wmem_max=536870912" >> /etc/sysctl.conf
echo "net.core.wmem_default=1048576" >> /etc/sysctl.conf
echo "net.core.optmem_max=65536" >> /etc/sysctl.conf
echo "net.ipv4.tcp_rmem=4096 87380 536870912" >> /etc/sysctl.conf
echo "net.ipv4.tcp_wmem=4096 65536 536870912" >> /etc/sysctl.conf
echo "net.ipv4.udp_rmem_min=8192" >> /etc/sysctl.conf
echo "net.ipv4.udp_wmem_min=8192" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
echo "net.ipv4.tcp_mtu_probing=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_sack=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling=1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_moderate_rcvbuf=1" >> /etc/sysctl.conf
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf

sysctl -p

