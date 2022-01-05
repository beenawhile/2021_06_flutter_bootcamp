# FROM golang:alpine as build-env

# ENV GO111MODULE=on

# RUN apk update && apk add bash ca-certificates git gcc g++ libc-dev

# RUN mkdir /flutter_grpc
# RUN mkdir -p /flutter_grpc/proto

# WORKDIR /flutter_grpc

# COPY ./proto/user.pb.go /flutter_grpc/proto
# COPY ./main.go /flutter_grpc

# COPY go.mod .
# COPY go.sum .

# RUN go mod download

# RUN go build -o flutter_grpc .

# CMD ./flutter_grpc

FROM golang:1.17.0

WORKDIR ./

COPY go.mod go.sum ./
RUN go mod download

COPY server/ ./server/

WORKDIR ./server


RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /server .

FROM alpine:3.12.0

COPY --from=0 /server /usr/local/bin/server

EXPOSE 50051

ENTRYPOINT ["/usr/local/bin/server"]