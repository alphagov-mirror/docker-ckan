#!/usr/bin/env bash

if [[ ! -z $1 && $1 == '2.8' ]]; then
    CKAN_VERSION=2.8.3-dgu
    SRC_DIR=2.8
else
    CKAN_VERSION=2.7.6
    SRC_DIR=2.7
fi

mkdir -p src/$SRC_DIR
cd src/$SRC_DIR

# This should match settings in Dockerfile.dev in ckan project
HARVEST_SHA=713a0fb04ff790d847824df427fa40a3f91bbc7c

git clone --branch ckan-$CKAN_VERSION https://github.com/alphagov/ckan

git clone https://github.com/alphagov/ckanext-datagovuk
git clone https://github.com/ckan/ckanext-harvest
(cd ckanext-harvest && git checkout $HARVEST_SHA)
git clone --branch dgu-fixes https://github.com/alphagov/ckanext-spatial
git clone https://github.com/geopython/pycsw.git --branch 2.4.0 
