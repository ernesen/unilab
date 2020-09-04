#!/bin/bash
npm install -g @angular/cli
npm install --save-dev @angular-devkit/build-angular
ng build --prod
docker build  -f Dockerfile -t ernesen/frontend:2.0 .
#docker tag frontend ernesen/frontend:2.0
docker push ernesen/frontend:2.0

docker run --rm -d --name frontend -h frontend -p 4200:4200 ernesen/frontend:2.0

docker logs -f frontend