#!/bin/bash

CURRENT_DIR=$PWD

set -e
    echo "Deploy FE ..."
    cd $WORKING_DIR/jenkins/scripts

    docker-compose -f docker-compose-fe.yml up -d

    cd $CURRENT_DIR
