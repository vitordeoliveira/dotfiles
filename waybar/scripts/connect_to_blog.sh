#!/usr/bin/env bash

source ~/.bashrc

ip=$IP_BLOG

alacritty -e bash -c "echo ${ip}; exec bash"
