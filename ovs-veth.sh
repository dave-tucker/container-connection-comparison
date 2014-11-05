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
# create a port pair
ip link add tap1 type veth peer name ovs-tap1
# attach one side to ovs
ovs-vsctl add-port $BRIDGE ovs-tap1
# attach the other side to namespace
ip link set tap1 netns ns1
# set the ports to up
ip netns exec ns1 ip link set dev tap1 up
ip link set dev ovs-tap1 up
#
#### PORT 2
# create a port pair
ip link add tap2 type veth peer name ovs-tap2
# attach one side to ovs
ovs-vsctl add-port $BRIDGE ovs-tap2
# attach the other side to namespace
ip link set tap2 netns ns2
# set the ports to up
ip netns exec ns2 ip link set dev tap2 up
ip link set dev ovs-tap2 up
#

# set ip addresses
ip netns exec ns1 ifconfig tap1 10.10.10.1/24 up
ip netns exec ns2 ifconfig tap2 10.10.10.2/24 up
