import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/application/greet_notifier.dart';
import 'package:mobile/core/shared/providers.dart';

import '../../widgets/greet_form.dart';
import '../../widgets/grpc_tab_view.dart';

class BidirectionalView extends ConsumerStatefulWidget {
  const BidirectionalView({Key? key}) : super(key: key);

  @override
  _BidirectionalViewState createState() => _BidirectionalViewState();
}

class _BidirectionalViewState extends ConsumerState<BidirectionalView> {
  final List<String> _responses = [];
  final ScrollController _controller = ScrollController();

  static const description =
      'Implementation of bidirectional streaming. The client sends a Stream of requests and simultaneously receives a Stream of responses';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(greetStateNotifierProvider);

    ref.listen<GreetState>(greetStateNotifierProvider, (prevStat, curState) {
      curState.maybeWhen(
        greetEveryoneSuccess: (result) {
          setState(() {
            _responses.add(result);
          });
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            if (_controller.hasClients) {
              _controller.animateTo(
                _controller.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          });
        },
        initial: () {
          setState(() {
            _responses.clear();
          });
        },
        orElse: () {},
      );
    });

    return GrpcTabView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(description),
          ),
          Consumer(builder: (context, ref, child) {
            return GreetForm(
              onAdd: (fname, lname) {
                ref
                    .read(greetStateNotifierProvider.notifier)
                    .bidirectionalAdd(fname, lname);
              },
              submitLabel: 'Close',
              onSubmit: (_, __) {
                ref
                    .read(greetStateNotifierProvider.notifier)
                    .closeBidirectional();
              },
            );
          }),
          const SizedBox(height: 100),
          Text(
            'Responses (${_responses.length})',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          state.maybeWhen(
            greetEveryoneSuccess: (result) => SizedBox(
              height: 100,
              child: ListView.builder(
                controller: _controller,
                itemCount: _responses.length,
                itemBuilder: (context, index) {
                  return Text(_responses[index]);
                },
              ),
            ),
            loading: () => const CircularProgressIndicator(),
            greetFailure: (failure) => Text(
              failure,
              textAlign: TextAlign.center,
            ),
            orElse: () => const Text('No data'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
