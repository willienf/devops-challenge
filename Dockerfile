FROM golang:latest

# TODO: Use a container to build this and just use binary

COPY src/main.go /go/src/app/
WORKDIR /go/src/app
RUN go build -o main . && rm -Rf main.go

EXPOSE 8080

CMD [ "/go/src/app/main" ]
