#!/bin/bash

CURRENT_DIR=$PWD

set -e

    echo "### Get the latest version in dev branch###"
    cd $WORKING_DIR/jenkins/repos/CCTIV_BE
    git checkout dev && git pull origin dev

    cd $CURRENT_DIR
    echo "### Change directory to scripts ... ###"
    cd $WORKING_DIR/jenkins/scripts

    echo "### Checkout to dev in DevOps repo ###"
    git checkout dev && git pull origin dev

    echo "### Copy file to build floder ###"
    cp -R $BE_REPO_PATH/src ./build_be_product
    cp -R $BE_REPO_PATH/tests ./build_be_product
    cp $BE_REPO_PATH/

    echo "### Starting build ###"
    docker-compose -f docker-compose-be.yml build --no-cache

    echo "### Build BE images is completed ...###"
    cd $CURRENT_DIR
