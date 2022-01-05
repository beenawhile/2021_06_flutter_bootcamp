import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/application/greet_notifier.dart';
import 'package:mobile/core/service/greet_service_base.dart';
import 'package:mobile/core/service/mobile/greet_service_mobile.dart';

final greetMobileServiceProvider = Provider<GreetServiceBase>(
  (ref) => GreetServiceMobile(),
);

final greetStateNotifierProvider =
    StateNotifierProvider<GreetStateNotifier, GreetState>(
  (ref) => GreetStateNotifier(
    ref.watch(greetMobileServiceProvider),
  ),
);
