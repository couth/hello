# hello

```bash
$ENV:CGO_ENABLED=0
$ENV:GOOS="linux"
$ENV:GOARCH="amd64"
go build -o application
docker buildx build --platform linux/amd64 --output type=image,dest=./output -t couth/hello:v1.0 .
# docker buildx build --platform linux/amd64 --output type=tar,dest=./hello.tar -t couth/hello:v1.0 .

docker run -itd --name hello -p 8080:8080 couth/hello:v1.0 /bin/bash



```