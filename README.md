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

yaml

```
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-deployment
  labels:
    app: hello
spec:
  selector:
    matchLabels:
      app: hello
  replicas: 3
  minReadySeconds: 5
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  template:
    metadata:
      labels:
        app: hello
    spec:
      containers:
      - image: couth/hello:v1.0
        name: hello
        imagePullPolicy: Never
        command: ["./application"]
        ports:
        - containerPort: 8080
          protocol: TCP
---
apiVersion: v1
kind: Service
metadata:
  name: hello-service
  labels:
    app: hello
spec:
  selector:
    app: hello
  ports:
    - name: hello-port
      protocol: TCP
      port: 8080
      targetPort: 8080
      nodePort: 32080
  type: NodePort

```