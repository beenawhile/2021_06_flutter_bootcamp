import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/repository/fake_todo_repository.dart';
import 'package:riverpod_practice/todo_state.dart';

import 'models/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        todoRepositoryProvider.overrideWithValue(FakeTodoRepository())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
              child: const HomePage()),
        ),
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(todoExceptionProvider,
        (StateController<TodoException?> exceptionState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            exceptionState.state!.error.toString(),
          ),
        ),
      );
    });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "TODOS",
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          actions: const [
            _Menu(),
          ],
          bottom: const TabBar(
            tabs: [
              Text(
                "All",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                "Completed",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: [
            Column(
              children: const [
                AddTodoPanel(),
                SizedBox(height: 20),
                _TodoList()
              ],
            ),
            const _CompletedTodos()
          ]),
        ),
      ),
    );
  }
}

class _TodoList extends StatefulWidget {
  const _TodoList({Key? key}) : super(key: key);

  @override
  __TodoListState createState() => __TodoListState();
}

class __TodoListState extends State<_TodoList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Consumer(
      builder: (context, ref, child) {
        print("rebuilt!");
        final todosState = ref.watch(todosNotifierProvider);
        return todosState.when(
          data: (todos) {
            return RefreshIndicator(
              onRefresh: () {
                return ref.read(todosNotifierProvider.notifier).refresh();
              },
              child: ListView(children: [
                ...todos
                    .map((todo) => ProviderScope(
                          overrides: [_currentTodo.overrideWithValue(todo)],
                          child: const TodoItem(),
                        ))
                    .toList()
              ]),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          error: (e, st) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Todos could not be loaded"),
                  ElevatedButton(
                    onPressed: () => ref
                        .read(todosNotifierProvider.notifier)
                        .retryLoadingTodo(),
                    child: const Text("Retry"),
                  )
                ],
              ),
            );
          },
        );
      },
    ));
  }
}

class _CompletedTodos extends ConsumerWidget {
  const _CompletedTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosState = ref.watch(completedTodosProvider);
    return todosState.when(
      data: (todos) {
        return ListView(
          children: [
            ...todos
                .map(
                  (todo) => ProviderScope(
                    overrides: [_currentTodo.overrideWithValue(todo)],
                    child: const TodoItem(),
                  ),
                )
                .toList(),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => const Center(child: Text("Something went wrong")),
    );
  }
}

final _currentTodo = Provider<Todo>((ref) => throw UnimplementedError());

class TodoItem extends StatefulWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, selecet) {
        final todo = ref.watch(_currentTodo);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (_) =>
                ref.read(todosNotifierProvider.notifier).remove(todo.id),
            child: FocusScope(
              child: Focus(
                onFocusChange: (isFocus) {
                  if (!isFocus) {
                    setState(() {
                      hasFocus = false;
                    });
                    ref.read(todosNotifierProvider.notifier).edit(
                          id: todo.id,
                          description: _textEditingController.text,
                        );
                  } else {
                    _textEditingController.text = todo.description;
                    _textEditingController.selection =
                        TextSelection.fromPosition(
                      TextPosition(
                        offset: _textEditingController.text.length,
                      ),
                    );
                  }
                },
                child: ListTile(
                  onTap: () {
                    setState(() {
                      hasFocus = true;
                    });
                    _focusNode.requestFocus();
                  },
                  title: hasFocus
                      ? TextField(
                          controller: _textEditingController,
                          focusNode: _focusNode,
                        )
                      : Text(todo.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: todo.completed,
                        onChanged: (_) => ref
                            .read(todosNotifierProvider.notifier)
                            .toggle(todo.id),
                      ),
                      IconButton(
                          onPressed: () => ref
                              .read(todosNotifierProvider.notifier)
                              .remove(todo.id),
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AddTodoPanel extends ConsumerStatefulWidget {
  const AddTodoPanel({Key? key}) : super(key: key);

  @override
  _AddTodoPanelState createState() => _AddTodoPanelState();
}

class _AddTodoPanelState extends ConsumerState<AddTodoPanel> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onSubmit([String? value]) {
    ref
        .read(todosNotifierProvider.notifier)
        .add(_textEditingController.value.text);
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(hintText: "New Todo"),
              onSubmitted: _onSubmit,
            ),
          ),
          IconButton(
            onPressed: _onSubmit,
            icon: const Icon(Icons.check),
          )
        ],
      ),
    );
  }
}

enum _MenuOptions { deleteOnComplete }

class _Menu extends ConsumerWidget {
  const _Menu({Key? key}) : super(key: key);

  Future<void> onSeleceted(WidgetRef ref, _MenuOptions result) async {
    if (result == _MenuOptions.deleteOnComplete) {
      final currentSettings = ref.read(settingsProvider).state.deleteOnComplete;
      ref.read(settingsProvider).state =
          Settings(deleteOnComplete: !currentSettings);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCheck = ref.watch(settingsProvider).state.deleteOnComplete;
    return PopupMenuButton<_MenuOptions>(
      onSelected: (result) => onSeleceted(ref, result),
      icon: const Icon(Icons.menu),
      itemBuilder: (context) => <PopupMenuEntry<_MenuOptions>>[
        PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.deleteOnComplete,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            const Text("Delete on complete"),
            Checkbox(value: isCheck, onChanged: null)
          ]),
        )
      ],
    );
  }
}
