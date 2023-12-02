#!/bin/bash
echo"Script to Run Network Management Commands"
echo "--"
echo "Check Ip Address:"
ip addr
echo "--" 
echo "Check Mac Addresses:"
ip -o link show |cut -d ‘ ‘ -f 2,20
echo "--" 
echo "Check ARP table:"
ARP -t ib -a
echo "--" 
echo "Check IP Routing Tables:"
netstat -r
echo "--" 
echo "Check Open Ports:"
sudo ss -tunl
echo "--" 
echo "Capture Traffic:"
echo "Output to ./netcapt.pcap file."
echo "I had to watch the video on this one, my method only works on debian..."
timeout 10s sudo tcpdump -eth18 -w ./netcapt.pcap
echo "--" 
echo "Check CPU and Memory Usage:"
vmstat
free
echo "--" 
echo "Process Status:"
timeout 2s top
echo "--" 
echo "Stop a service and start a service:"
systemctl status sshd
systemctl stop sshd
systemctl status sshd
systemctl start sshd
systemctl status sshd
echo "--" 
echo "Retrieve Kernel Version:"
hostnamectl