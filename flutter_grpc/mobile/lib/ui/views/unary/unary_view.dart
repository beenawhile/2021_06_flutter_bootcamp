import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/shared/providers.dart';
import 'package:mobile/ui/widgets/greet_form.dart';
import 'package:mobile/ui/widgets/grpc_tab_view.dart';

class UnaryView extends StatelessWidget {
  const UnaryView({Key? key}) : super(key: key);

  static const descrption =
      'Implementation of a unary RPC. The client sends a static request and receives a static response.';
  @override
  Widget build(BuildContext context) {
    return GrpcTabView(
        child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(descrption),
        ),
        Consumer(builder: (context, ref, child) {
          return GreetForm(onSubmit: (fname, lname) {
            ref
                .read(greetStateNotifierProvider.notifier)
                .greetOnce(fname, lname);
          });
        }),
        const SizedBox(height: 100),
        Text(
          "Response",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(greetStateNotifierProvider);
              return state.maybeWhen(
                greetOnceSuccess: (result) => Text(result),
                loading: () => const AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator(),
                ),
                greetFailure: (failure) => Text(failure),
                orElse: () => const Text("No Data"),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    ));
  }
}
