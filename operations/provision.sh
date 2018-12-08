#!/usr/bin/env bash

cd "$(dirname "$0")"

CREATE_OR_UPDATE=$1

if [ "$CREATE_OR_UPDATE" = "" ]; then
    CREATE_OR_UPDATE=update
fi

aws cloudformation ${CREATE_OR_UPDATE}-stack \
    --stack-name demo-vpc \
    --template-body file://cf-infrastructure.yaml \
    --capabilities CAPABILITY_NAMED_IAM
