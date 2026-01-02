docker stop backend
docker rm backend
docker run -d myrepo/backend:previous
