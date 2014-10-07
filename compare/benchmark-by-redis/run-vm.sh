#!/bin/bash
#
# Run redis-benchmark on VM (Ubuntu Linux).
#


vagrant up redis1

vagrant ssh  -c "cd /vagrant ; ./run-vm-inside.sh"  redis1

