#!/bin/bash

# prerequisites
sudo apt-get -qq -y install openvswitch-switch

# add the namespaces
ip netns add ns1
ip netns add ns2

# create the switch
BRIDGE=ovs-test
ovs-vsctl add-br $BRIDGE

#
#### PORT 1
# create an internal ovs port
ovs-vsctl add-port $BRIDGE tap1 -- set Interface tap1 type=internal
# attach it to namespace
ip link set tap1 netns ns1
# set the ports to up
ip netns exec ns1 ip link set dev tap1 up
#
#### PORT 2
# create an internal ovs port
ovs-vsctl add-port $BRIDGE tap2 -- set Interface tap2 type=internal
# attach it to namespace
ip link set tap2 netns ns2
# set the ports to up
ip netns exec ns2 ip link set dev tap2 up

# set ip addresses
ip netns exec ns1 ifconfig tap1 10.10.10.1/24 up
ip netns exec ns2 ifconfig tap2 10.10.10.2/24 up
