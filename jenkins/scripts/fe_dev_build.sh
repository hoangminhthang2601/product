#!/bin/bash
CURRENT_DIR=$PWD

set -e

    echo "### Get the latest version in dev branch###"


    cd $WORKING_DIR/jenkins/repos/CCTIV_FE

    echo "### pull repo ###"
    git config pull.rebase false && \
    git checkout dev && \
    git pull origin dev

    cd $CURRENT_DIR
    echo "### Change directory to scripts ... ###"
    cd $WORKING_DIR/jenkins/scripts
    echo "### Checkout to dev in DevOps repo ###"
    git checkout dev && git pull origin dev

    echo "### Copy file to build floder ###"
    cp -R $FE_REPO_PATH/cctiv_fe ./build_fe

    echo "### Starting build ###"
    docker-compose -f docker-compose-fe.yml build --no-cache

    echo "### Build BE images is completed ...###"
    cd $CURRENT_DIR
