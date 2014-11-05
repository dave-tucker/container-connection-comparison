#!/bin/bash

# prerequisites
sudo apt-get -qq -y install iperf

sudo ip netns exec ns2 iperf -s &
sudo ip netns exec ns1 iperf -c 10.10.10.2 -t 60 -i 10
