#!/bin/bash

CURRENT_DIR=$PWD

set -e
    echo "Deploy BE ..."
    cd $WORKING_DIR/jenkins/scripts

    docker-compose -f docker-compose-be.yml up -d

    cd $CURRENT_DIR
