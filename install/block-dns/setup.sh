#!/usr/bin/env bash

curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | sudo tee -a /etc/hosts

wc -l /etc/hosts
