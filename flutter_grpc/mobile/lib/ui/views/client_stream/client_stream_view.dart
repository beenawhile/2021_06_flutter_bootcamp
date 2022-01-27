import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/shared/providers.dart';
import 'package:mobile/ui/widgets/greet_form.dart';
import 'package:mobile/ui/widgets/grpc_tab_view.dart';

class ClientStreamView extends StatelessWidget {
  const ClientStreamView({Key? key}) : super(key: key);

  static const description =
      'Implementation of client-side streaming. The client sends a Stream of requests, then receives a static response.';

  @override
  Widget build(BuildContext context) {
    return GrpcTabView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(description),
          ),
          Consumer(
            builder: (context, ref, child) {
              return GreetForm(
                onAdd: (fname, lname) {
                  ref
                      .read(greetStateNotifierProvider.notifier)
                      .longGreetAdd(fname, lname);
                },
                onSubmit: (_, __) {
                  ref
                      .read(greetStateNotifierProvider.notifier)
                      .longGreetClose();
                },
              );
            },
          ),
          const SizedBox(height: 100),
          Text(
            "Response",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Consumer(builder: (context, ref, child) {
            final state = ref.watch(greetStateNotifierProvider);
            return state.maybeWhen(
              longGreetSuccess: (result) => Text(result),
              loading: () => const CircularProgressIndicator(),
              greetFailure: (failure) =>
                  Text(failure, textAlign: TextAlign.center),
              orElse: () => const Text("No Data"),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
