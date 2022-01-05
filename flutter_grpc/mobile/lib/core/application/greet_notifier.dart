import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../service/greet_service_base.dart';

part 'greet_notifier.freezed.dart';

@freezed
class GreetState with _$GreetState {
  const GreetState._();
  const factory GreetState.initial() = _Initial;
  const factory GreetState.loading() = _Loading;
  const factory GreetState.greetOnceSuccess(String result) = _GreetOnceSuccess;
  const factory GreetState.greetManySuccess(String result) = _GreetManySuccess;
  const factory GreetState.longGreetSuccess(String result) = _LongGreetSuccess;
  const factory GreetState.greetEveryoneSuccess(String result) =
      _GreetEveryoneSuccess;
  const factory GreetState.greetFailure(String exception) = _GreetFailure;
}

class GreetStateNotifier extends StateNotifier<GreetState> {
  GreetStateNotifier(
    this._greetService,
  ) : super(const GreetState.initial());

  final GreetServiceBase _greetService;

  Future<void> greetOnce(String firstName, String lastName) async {
    state = const GreetState.loading();
    try {
      final result = await _greetService.greetOnce(firstName, lastName);
      state = GreetState.greetOnceSuccess(result);
    } catch (e) {
      state = GreetState.greetFailure(e.toString());
    }
  }

  Future<void> greetMany(String firstName, String lastName) async {
    state = const GreetState.loading();
    try {
      final responses = _greetService.greetMany(firstName, lastName);
      await for (final result in responses) {
        state = GreetState.greetManySuccess(result);
      }
    } catch (e) {
      state = GreetState.greetFailure(e.toString());
    }
  }

  StreamController<List<String>>? _longGreetController;
  Completer<String>? _longGreetCompleter;

  Future<void> longGreetAdd(String firstName, String lastName) async {
    if (_longGreetController == null) {
      state = const GreetState.loading();
      _longGreetController = StreamController<List<String>>();
      _longGreetCompleter = Completer<String>();
      _greetService
          .longGreet(_longGreetController!.stream)
          .then((result) => _longGreetCompleter!.complete(result))
          .catchError((err) {
        _longGreetCompleter!.completeError(err);
      });
    }
    _longGreetController!.add([firstName, lastName]);
  }

  Future<void> longGreetClose() async {
    if (_longGreetController == null) {
      return;
    }

    _longGreetController!.close();
    try {
      final result = await _longGreetCompleter!.future;
      state = GreetState.longGreetSuccess(result);
    } catch (e) {
      state = GreetState.greetFailure(e.toString());
    } finally {
      _longGreetController = null;
      _longGreetCompleter = null;
    }
  }

  StreamController<List<String>>? bidirectionalController;

  Future<void> bidirectionalAdd(String firstName, String lastName) async {
    if (bidirectionalController == null) {
      state = const GreetState.loading();
      bidirectionalController = StreamController<List<String>>();
      bidirectionalController!.add([firstName, lastName]);
      final stream =
          _greetService.greetEveryone(bidirectionalController!.stream);
      try {
        await for (final result in stream) {
          state = GreetState.greetEveryoneSuccess(result);
        }
      } catch (e) {
        state = GreetState.greetFailure(e.toString());
      } finally {
        closeBidirectional();
      }
    }
  }

  void closeBidirectional() {
    if (bidirectionalController != null) {
      bidirectionalController!.close();
      bidirectionalController = null;
    }
  }

  void reset() {
    if (_longGreetController != null) {
      _longGreetController!.close();
      _longGreetController = null;
      _longGreetCompleter = null;
    }

    if (bidirectionalController != null) {
      bidirectionalController!.close();
      bidirectionalController = null;
    }
  }
}
