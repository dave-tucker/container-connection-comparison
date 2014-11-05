#!/bin/bash

# add the namespaces
ip netns add ns1
ip netns add ns2

ip link add mv1 link eth0 type macvlan mode bridge
ip link add mv2 link eth0 type macvlan mode bridge
ip link set mv1 netns ns1
ip link set mv2 netns ns2
ip netns exec ns1 ip link set dev mv1 up
ip netns exec ns2 ip link set dev mv2 up

# set ip addresses
ip netns exec ns1 ifconfig mv1 10.10.10.1/24 up
ip netns exec ns2 ifconfig mv2 10.10.10.2/24 up
