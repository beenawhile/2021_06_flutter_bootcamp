package main

import (
	"flutter_grpc/server/model/greetpb"
	"fmt"
	"io"
	"log"
	"net"
	"time"

	context "golang.org/x/net/context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type server struct {
	greetpb.UnimplementedGreetServiceServer
}

func (*server) Greet(ctx context.Context, req *greetpb.GreetRequest) (*greetpb.GreetResponse, error) {
	log.Printf("Greet invoked with %v\n", req)

	firstName := req.GetGreeting().GetFirstName()
	lastName := req.GetGreeting().GetLastName()

	if firstName == "" || lastName == "" {
		return nil, status.Errorf(codes.InvalidArgument, "Missing first name or last name")
	}

	return &greetpb.GreetResponse{
		Result: fmt.Sprintf("Hello, %s %s", firstName, lastName),
	}, nil
}

func (s *server) GreetMany(req *greetpb.GreetManyRequest, stream greetpb.GreetService_GreetManyServer) error {

	log.Printf("GreetMany invoked with %v\n", req)

	firstName := req.GetGreeting().GetFirstName()
	lastName := req.GetGreeting().GetLastName()

	if firstName == "" || lastName == "" {
		return status.Errorf(codes.InvalidArgument, "Missing first name or last name")
	}

	for i := 0; i < 10; i++ {
		result := fmt.Sprintf("Hello, %s %s, number %d", firstName, lastName, i)
		log.Printf("Sending '%s' to client\n", result)
		res := &greetpb.GreetManyResponse{
			Result: result,
		}
		stream.Send(res)
		time.Sleep(1000 * time.Millisecond)
	}

	stream.Send(&greetpb.GreetManyResponse{
		Result: "End of stream",
	})

	return nil
}

func (*server) LongGreet(stream greetpb.GreetService_LongGreetServer) error {
	log.Println("LongGreet invoked")

	result := ""

	for {
		req, err := stream.Recv()
		if err == io.EOF {
			break
		}
		if err != nil {
			errMsg := fmt.Sprintf("Error while reading client stream: %v", err)
			log.Println(errMsg)
			return status.Error(codes.Internal, errMsg)
		}

		firstName := req.GetGreeting().GetFirstName()
		lastName := req.GetGreeting().GetLastName()

		if firstName == "" || lastName == "" {
			return status.Errorf(codes.InvalidArgument, "Missing first name or last name")
		}

		newPerson := fmt.Sprintf("%s %s", firstName, lastName)

		log.Printf("LongGreet received %s\n", newPerson)

		result += fmt.Sprintf("Hello, %s!\n", newPerson)
	}

	return stream.SendAndClose(&greetpb.LongGreetResponse{
		Result: result,
	})
}

func (*server) GreetEveryone(stream greetpb.GreetService_GreetEveryoneServer) error {
	log.Println("GreetEveryone invoked")

	numberOfMsg := 0

	for {
		req, err := stream.Recv()
		if err == io.EOF {
			break
		}
		if err != nil {
			errMsg := fmt.Sprintf("Error while reading client stream: %v", err)
			log.Println(errMsg)
			return status.Error(codes.Internal, errMsg)
		}

		firstName := req.GetGreeting().GetFirstName()
		lastName := req.GetGreeting().GetLastName()

		if firstName == "" || lastName == "" {
			return status.Errorf(codes.InvalidArgument, "Missing first name or last name")
		}

		result := fmt.Sprintf("Hello, %s %s, number %d", firstName, lastName, numberOfMsg)
		numberOfMsg++

		log.Printf("GreetEveryone received %s\n", result)

		err = stream.Send(&greetpb.GreetEveryoneResponse{
			Result: result,
		})
		if err != nil {
			return err
		}
	}

	stream.Send(&greetpb.GreetEveryoneResponse{
		Result: "End of stream",
	})

	return nil
}

func newServer() *server {
	return &server{}
}

func main() {

	lis, err := net.Listen("tcp", "0.0.0.0:50051")
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}

	grpcServer := grpc.NewServer()
	greetpb.RegisterGreetServiceServer(grpcServer, newServer())

	fmt.Println("Server started: 0.0.0:50051")

	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}

}

// // for docker
// var grpcLog glog.LoggerV2

// func init() {
// 	grpcLog = glog.NewLoggerV2(os.Stdout, os.Stdout, os.Stdout)
// 	// Logger for info msg, waring msg, error msg
// }

// type Connection struct {
// 	stream pb.Broadcast_CreateStreamServer
// 	id     string
// 	active bool
// 	error  chan error
// }

// type Server struct {
// 	pb.UnimplementedBroadcastServer
// 	Connection []*Connection
// }

// func (s *Server) CreateStream(pconn *pb.Connect, stream pb.Broadcast_CreateStreamServer) error {
// 	conn := &Connection{
// 		stream: stream,
// 		id:     pconn.User.Id,
// 		active: true,
// 		error:  make(chan error),
// 	}

// 	s.Connection = append(s.Connection, conn)

// 	return <-conn.error
// }

// func (s *Server) BroadcastMessage(ctx context.Context, msg *pb.Message) (*pb.Close, error) {
// 	// WaitGroup: a counter that allows us to count the various goroutines
// 	//  it waits for the goroutine to finish and decrements the counter accordingly
// 	wait := sync.WaitGroup{}
// 	done := make(chan int)

// 	for _, conn := range s.Connection {
// 		wait.Add(1)

// 		go func(msg *pb.Message, conn *Connection) {
// 			// when goroutine is finished running, the weight group will be decremented
// 			defer wait.Done()

// 			if conn.active {
// 				// passing message to client
// 				err := conn.stream.Send(msg)
// 				grpcLog.Info("Sending message to: ", conn.stream)

// 				if err != nil {
// 					grpcLog.Errorf("Error with Stream: %s - Error: %v", conn.stream, err)
// 					conn.active = false
// 					conn.error <- err
// 				}
// 			}

// 		}(msg, conn)
// 	}

// 	go func() {
// 		// makes sure the wait group will wait for all the other goroutine to exit
// 		wait.Wait()
// 		close(done)
// 	}()

// 	<-done
// 	return &pb.Close{}, nil
// }

// func main() {
// 	var connections []*Connection

// 	server := &Server{Connection: connections}

// 	grpcServer := grpc.NewServer()
// 	listener, err := net.Listen("tcp", ":8080")
// 	if err != nil {
// 		log.Fatalf("error creating the server %v", err)
// 	}
// 	grpcLog.Info("Starting server at port : 8080")

// 	pb.RegisterBroadcastServer(grpcServer, server)
// 	err = grpcServer.Serve(listener)
// 	if err != nil {
// 		log.Fatalf("error serving grpc server %v", err)
// 	}
// }
