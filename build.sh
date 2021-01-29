#! /bin/bash
set -xe

export $(egrep -v '^#' .env | xargs)

cd images/onec-full
bash make.sh
docker push demoncat/onec:${ONEC_VERSION}
cd ../../

cd images/onec-server
bash make.sh
docker push demoncat/onec-server:${ONEC_VERSION}
cd ../../

cd images/onec-rac
bash make.sh
cd ../../docker push demoncat/onec-rac:${ONEC_VERSION}
