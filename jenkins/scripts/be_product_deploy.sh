#!/bin/bash

CURRENT_DIR=$PWD

set -e
    echo "Deploy BE ..."
    cd $WORKING_DIR/jenkins/scripts
    
    echo "Migrate database"
    docker-compose -f docker-compose-be.yml run --rm be sh -c "alembic upgrade head"

    echo "Up services ..."
    docker-compose -f docker-compose-be.yml up -d

    cd $CURRENT_DIR
