# grpc-hello-world

## install tool

```bash
brew install ghz
```

## build docker

```bash
docker build --tag grpc-greeter-server:latest .
```

## run docker

```bash
docker run -p 50051:50051 grpc-greeter-server
```

## ghz go benchmark tool

```bash
# load start, end ,step, duration
ghz --insecure --async --proto ./helloworld.proto \
  --call helloworld.Greeter/SayHello \
  -c 10 -n 10000 \
  --load-schedule=step --load-start=50 --load-end=150 --load-step=10 --load-step-duration=5s \
  -d '{"name":"{{.WorkerID}}"}' 0.0.0.0:50051

# output.html
ghz --insecure --async --proto ./helloworld.proto \
  --call helloworld.Greeter/SayHello \
  -c 100 -n 1000 \
  --load-schedule=step --load-start=50 --load-end=150 --load-step=10 --load-step-duration=1s \
  -d '{"name":"{{.WorkerID}}"}' 0.0.0.0:50051 -O html > output.html
```