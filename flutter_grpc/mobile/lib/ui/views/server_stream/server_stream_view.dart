import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/application/greet_notifier.dart';
import 'package:mobile/core/shared/providers.dart';
import 'package:mobile/ui/widgets/greet_form.dart';
import 'package:mobile/ui/widgets/grpc_tab_view.dart';

class ServerStreamView extends ConsumerStatefulWidget {
  const ServerStreamView({Key? key}) : super(key: key);

  @override
  _ServerStreamViewState createState() => _ServerStreamViewState();
}

class _ServerStreamViewState extends ConsumerState<ServerStreamView> {
  final ScrollController _controller = ScrollController();
  final List<String> _responses = [];
  bool _enabled = true;

  static const description =
      'Implementation of server-side streaming. The client sends one request and receives a Stream of responses.';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(greetStateNotifierProvider);

    ref.listen<GreetState>(
      greetStateNotifierProvider,
      (prevState, curState) {
        curState.maybeWhen(
          greetManySuccess: (result) {
            setState(() {
              _responses.add(result);
              _enabled = false;
            });
            WidgetsBinding.instance!.addPostFrameCallback(
              (_) {
                if (_controller.hasClients) {
                  _controller.animateTo(
                    _controller.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
            );
          },
          initial: () {
            setState(() {
              _responses.clear();
              _enabled = true;
            });
          },
          orElse: () {},
        );
      },
    );

    return GrpcTabView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(description),
          ),
          GreetForm(
            submitEnabled: _enabled,
            onSubmit: (fname, lname) {
              _responses.clear();
              ref
                  .read(greetStateNotifierProvider.notifier)
                  .greetMany(fname, lname);
            },
          ),
          const SizedBox(height: 100),
          Text(
            "Responses (${_responses.length})",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          state.maybeWhen(
            greetManySuccess: (result) => SizedBox(
              height: 100,
              child: ListView.builder(
                controller: _controller,
                itemCount: _responses.length,
                itemBuilder: (context, index) => Text(
                  _responses[index],
                ),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
            greetFailure: (failure) => Text(
              failure,
              textAlign: TextAlign.center,
            ),
            orElse: () => const Text("No data"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
