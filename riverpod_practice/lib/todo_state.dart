import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/repository/fake_todo_repository.dart';
import 'package:riverpod_practice/repository/todo_repository.dart';

import 'models/models.dart';

final settingsProvider = StateProvider<Settings>(
  (ref) => const Settings(),
);

final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => throw UnimplementedError(),
);

final todosNotifierProvider =
    StateNotifierProvider<TodosNotifier, AsyncValue<List<Todo>>>(
  (ref) => TodosNotifier(ref.read),
);

final completedTodosProvider = Provider<AsyncValue<List<Todo>>>((ref) {
  final todosState = ref.watch(todosNotifierProvider);
  return todosState.whenData(
    (todos) => todos.where((todo) => todo.completed).toList(),
  );
});

final todoExceptionProvider = StateProvider<TodoException?>((ref) => null);

class TodosNotifier extends StateNotifier<AsyncValue<List<Todo>>> {
  // AsyncValue: FutureProvider의 이점을 사용하기 위해 정의
  TodosNotifier(
    this.read, [
    AsyncValue<List<Todo>>? todos,
  ]) : super(todos ?? const AsyncValue.loading()) {
    _retrieveTodos();
  }

  final Reader read;
  AsyncValue<List<Todo>>? previousState;

  Future<void> _retrieveTodos() async {
    try {
      final todos = await read(todoRepositoryProvider).retrieveTodos();
      state = AsyncValue.data(todos);
    } on TodoException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> retryLoadingTodo() async {
    state = const AsyncValue.loading();
    try {
      final todos = await read(todoRepositoryProvider).retrieveTodos();
      state = AsyncValue.data(todos);
    } on TodoException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    try {
      final todos = await read(todoRepositoryProvider).retrieveTodos();
      state = AsyncValue.data(todos);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> add(String description) async {
    _cachedState();
    state = state.whenData((todos) => [...todos, Todo.create(description)]);

    try {
      await read(todoRepositoryProvider).addTodo(description);
    } on TodoException catch (e) {
      _handleException(e);
    }
  }

  Future<void> toggle(String id) async {
    if (read(settingsProvider).state.deleteOnComplete) {
      await remove(id);
      return;
    }

    _cachedState();
    state = state.whenData(
      (value) => value.map((todo) {
        if (todo.id == id) {
          return todo.copyWith(
            completed: !todo.completed,
          );
        } else {
          return todo;
        }
      }).toList(),
    );
    try {
      await read(todoRepositoryProvider).toggle(id);
    } on TodoException catch (e) {
      _handleException(e);
    }
  }

  Future<void> edit({required String id, required String description}) async {
    _cachedState();
    state = state.whenData((todos) {
      return [
        for (final todo in todos)
          if (todo.id == id)
            todo.copyWith(
              description: description,
            )
          else
            todo
      ];
    });

    try {
      await read(todoRepositoryProvider).edit(id: id, description: description);
    } on TodoException catch (e) {
      _handleException(e);
    }
  }

  Future<void> remove(String id) async {
    _cachedState();
    state = state.whenData(
      (value) => value
          .where(
            (element) => element.id != id,
          )
          .toList(),
    );
    try {
      await read(todoRepositoryProvider).remove(id);
    } on TodoException catch (e) {
      _handleException(e);
    }
  }

  void _cachedState() {
    previousState = state;
  }

  void _resetState() {
    if (previousState != null) {
      state = previousState!;
      previousState = null;
    }
  }

  void _handleException(TodoException e) {
    _resetState();
    read(todoExceptionProvider).state = e;
  }
}
