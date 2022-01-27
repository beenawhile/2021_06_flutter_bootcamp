# this will not be used
# only for reference
create:
	protoc --proto_path=proto proto/*.proto --go_out=.
	protoc --proto_path=proto proto/*.proto --go-grpc_out=.

clean:
	rm proto/*.go

greet:
	protoc --proto_path=proto \
	--go_out=server/model/greetpb \
	--go_opt=paths=source_relative \
	--go-grpc_out=server/model/greetpb \
	--go-grpc_opt=paths=source_relative \
	proto/greet.proto
	
### before create
#  $ export PATH="$PATH:$(go env GOPATH)/bin"









