#!/bin/bash

curl -O https://iperf.fr/download/fedora/iperf3-3.1.3-1.fc24.x86_64.rpm
rpm -i -f iperf3-3.1.3-1.fc24.x86_64.rpm


/sbin/ifconfig eth0 txqueuelen 10000 #Increase queue length in ETH interface  –
#Tune CentOS7/Debian8 OS parameters –
sysctl -w net.core.netdev_budget=50000 #Optimize empty buffers into memory:
sysctl -w net.core.netdev_budget_usecs=5000
sysctl -w net.core.somaxconn=1024 #Avoid issues on too many requests:
sysctl -w net.core.rmem_max=536870912 #Set high TCP read/write buffer memory size :
sysctl -w net.core.rmem_default=1048576
sysctl -w net.core.wmem_max=536870912
sysctl -w net.core.wmem_default=1048576
sysctl -w net.core.optmem_max=65536
#Tuning TCP parameters –
sysctl -w net.ipv4.tcp_rmem="4096 1048576 268435456" #Increase autotuing TCP read buffer limit:
sysctl -w net.ipv4.tcp_wmem="4096 65536 268435456" #Increase autotuing TCP write buffer limit:
sysctl -w net.ipv4.tcp_congestion_control=bbr #Set TCP congestion avoidance algorithm:
sysctl -w net.ipv4.tcp_mtu_probing=1 #Set probing for Jumbo Frames:
sysctl -w net.ipv4.tcp_sack=1 #Enable Selective Acknowledgement:
sysctl -w net.ipv4.tcp_window_scaling=1 #Set TCP window scaling beyond 64k:
sysctl -w net.ipv4.tcp_moderate_rcvbuf=1 #Set TCP window scaling for receiver:
