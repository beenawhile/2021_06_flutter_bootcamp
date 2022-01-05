# necessary command
## 1. install protobuf
    1) macOS
        $ brew install protobuf
    2) Windows
        $ choco install protoc
    3) Linux(Ubuntu)
        $ tar xzf protobuf-2.6.1.tar.gz
        $ cd protobuf-2.6.1
        $ sudo apt-get update
        $ sudo apt-get install build-essential
        $ sudo ./configure
        $ sudo make
        $ sudo make check
        $ sudo make install
        $ sudo ldconfig
        $ protoc --version

## 2. install gRPC-related package(for golang)
    $ go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26
    $ go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1


## 3. create proto buffer for go
    $ make create