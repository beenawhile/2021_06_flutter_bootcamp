package main

import (
	"context"
	"fmt"
	pb "grpc_yt/gen/proto"
	"log"

	"google.golang.org/grpc"
)

func main() {
	conn, err := grpc.Dial("localhost:8080", grpc.WithInsecure())
	if err != nil {
		log.Println(err)
	}

	client := pb.NewTestApiClient(conn)

	resp, err := client.Echo(context.Background(), &pb.ResponseRequest{Msg: "Hello world"})
	if err != nil {
		log.Println(err)
	}

	fmt.Println(resp)
}
