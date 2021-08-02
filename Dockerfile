FROM golang AS build

WORKDIR /go/src/greeter_server

ADD ./greeter_server /go/src/greeter_server
ADD ./helloworld /go/src/helloworld
ADD go.mod /go/src/go.mod

RUN go get -d ./
RUN go install ./

RUN CGO_ENABLED=0 go build -o /bin/grpc-greeter-server

FROM scratch
COPY --from=build /bin/grpc-greeter-server /bin/grpc-greeter-server

ENTRYPOINT [ "/bin/grpc-greeter-server" ]

EXPOSE 50051