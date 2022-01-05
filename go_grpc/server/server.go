package main

import (
	"context"
	"fmt"
	pb "grpc_yt/gen/proto"
	"log"
	"net"
	"net/http"

	"github.com/grpc-ecosystem/grpc-gateway/v2/runtime"
	"google.golang.org/grpc"
)

type testApiServer struct {
	pb.UnimplementedTestApiServer
}

func (s *testApiServer) Echo(ctx context.Context, req *pb.ResponseRequest) (*pb.ResponseRequest, error) {
	return req, nil
}

func (s *testApiServer) GetUser(ctx context.Context, req *pb.UserRequest) (*pb.UserResponse, error) {
	return &pb.UserResponse{}, nil
}

func main() {
	// work with http server
	go func() {
		// mux
		mux := runtime.NewServeMux()
		// register
		pb.RegisterTestApiHandlerServer(context.Background(), mux, &testApiServer{})
		// http server
		log.Fatalln(http.ListenAndServe("localhost:8081", mux))
	}()

	listener, err := net.Listen("tcp", "localhost:8080")
	if err != nil {
		log.Fatalln(err)
	}

	grpcServer := grpc.NewServer()

	pb.RegisterTestApiServer(grpcServer, &testApiServer{}) // handler

	fmt.Println("gRPC Server: ", 8080)

	err = grpcServer.Serve(listener)
	if err != nil {
		log.Println(err)
	}

}
