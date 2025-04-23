#!/bin/sh
rm -rfv vault-server{1..3}/file/*
rm -rfv load-balancer/certs/*

## remove from the unseal-output
rm -rfv unseal-script/unseal-output.txt