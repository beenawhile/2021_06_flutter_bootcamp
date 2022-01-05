import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/shared/providers.dart';
import '../views.dart';

class AppView extends ConsumerWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('gRPC Demo'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(child: Text('Unary')),
              Tab(child: Text('Server Stream')),
              Tab(child: Text('Client Stream')),
              Tab(child: Text('Bidirectional')),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'Reset',
              onPressed: () {
                ref.read(greetStateNotifierProvider.notifier).reset();
              },
            )
          ],
        ),
        body: const TabBarView(
          children: [
            UnaryView(),
            ServerStreamView(),
            ClientStreamView(),
            BidirectionalView(),
          ],
        ),
      ),
    );
  }
}
