#! /usr/bin/env bash

lsof -Pn -i4 | grep $1
