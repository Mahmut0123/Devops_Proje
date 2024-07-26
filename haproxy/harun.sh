#!/bin/bash

docker run -d --name haproxy -p 80:80 -v /home/finartz/proje/haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro haproxy:latest

