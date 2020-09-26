docker build -t flyeagle100/multi-docker-client:latest -t flyeagle100/multi-docker-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t flyeagle100/multi-docker-server:latest -t flyeagle100/multi-docker-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t flyeagle100/multi-docker-worker:latest -t flyeagle100/multi-docker-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push flyeagle100/multi-docker-client:latest
docker push flyeagle100/multi-docker-server:latest
docker push flyeagle100/multi-docker-worker:latest

docker push flyeagle100/multi-docker-client:$GIT_SHA
docker push flyeagle100/multi-docker-server:$GIT_SHA
docker push flyeagle100/multi-docker-worker:$GIT_SHA


kubectl apply -f k8s
kubectl set image deployments/server-deployment server=flyeagle100/multi-docker-server:$GIT_SHA
kubectl set image deployments/client-deployment client=flyeagle100/multi-docker-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=flyeagle100/multi-docker-worker:$GIT_SHA

