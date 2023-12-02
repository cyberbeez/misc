#!/bin/bash
echo "Script to Run Network Management Commands"
echo "--"
echo "Check Ip Address:"
echo "--"
ip addr
echo "--" 
echo "Check Mac Addresses:"
echo "--"
ip link show ens18
echo "--" 
echo "Check ARP table:"
echo "--"
arp -n
echo "--" 
echo "Check IP Routing Tables:"
echo "--"
netstat -r
echo "--" 
echo "Check Open Ports:"
echo "--"
sudo ss -tunl
echo "--" 
echo "Capture Traffic:"
echo "--"
echo "Output to ./netcapt.pcap file."
echo "I had to watch the video on this one, my method only works on debian..."
timeout 10s sudo tcpdump -eth18 -w ./netcapt.pcap
echo "using the 'tcpdump -eth18 -w ./netcapt.pcap' command..."
echo "--" 
echo "Check CPU and Memory Usage:"
echo "--"
vmstat
free
echo "--" 
echo "Process Status:"
echo "--"
ps -au
echo "--" 
echo "Stop a service and start a service:"
echo "--"
systemctl status sshd
systemctl stop sshd
systemctl status sshd
systemctl start sshd
systemctl status sshd
echo "--" 
echo "Retrieve Kernel Version:"
echo "--"
hostnamectl
echo "--"
echo "--"
echo "Done!"
