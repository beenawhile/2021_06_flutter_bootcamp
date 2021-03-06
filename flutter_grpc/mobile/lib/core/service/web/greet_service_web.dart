import 'package:grpc/grpc_web.dart';
import 'package:mobile/core/config/config.dart';

import '../../models/models.dart';
import '../greet_service_base.dart';

class GreetServiceWeb extends GreetServiceBase<GrpcWebClientChannel> {
  @override
  void init({GrpcWebClientChannel? channel, GreetServiceClient? client}) async {
    final host = await Config.host;
    final port = await Config.port;
    this.channel =
        channel ?? GrpcWebClientChannel.xhr(Uri.parse("http://$host:$port"));
    this.client = client ??
        GreetServiceClient(
          this.channel!,
          options: CallOptions(
            timeout: const Duration(seconds: 30),
          ),
        );
  }

  @override
  Future<String> longGreet(Stream<List<String>> stream) {
    throw UnsupportedError("Client-side streaming not yey supported on web.");
  }

  @override
  Stream<String> greetEveryone(Stream<List<String>> stream) {
    throw UnsupportedError("Bidirectional streaming not yet supported on web.");
  }
}
