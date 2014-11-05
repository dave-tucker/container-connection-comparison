Container Connection Comparison
===============================

A rough and ready comparison of performance for connecting containers via:

 - Linux Bridge with veth pairs
 - OVS with a veth pair
 - OVS with internal ports
 - Macvlan

Scripts for setting up Linux Bridge and OVS borrowed from [here](http://www.opencloudblog.com/?p=66)

## Usage

    vagrant up

    vagrant ssh ovs

    cd /vagrant
    ./ovs-internal.sh
    ./iperf.sh

Rinse an repeat for the other connection methods
