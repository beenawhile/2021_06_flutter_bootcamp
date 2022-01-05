# 반드시 경로에 폴더가 존재해야함
protoc --proto_path=proto \
	--go_out=server/model/greetpb \
	--go_opt=paths=source_relative \
	--go-grpc_out=server/model/greetpb \
	--go-grpc_opt=paths=source_relative \
    --dart_out=grpc:mobile/lib/core/models/greet \
    proto/greet.proto

## before create
# $ export PATH="$PATH:$(go env GOPATH)/bin"
## for dart
# $ dart pub global activate protoc_plugin
# $ export PATH="$PATH:$HOME/.pub-cache/bin"