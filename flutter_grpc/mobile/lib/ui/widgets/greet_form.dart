import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/application/greet_notifier.dart';
import 'package:mobile/core/shared/providers.dart';

class GreetForm extends ConsumerStatefulWidget {
  const GreetForm({
    Key? key,
    this.addLabel,
    this.submitLabel,
    this.addEnabled = true,
    this.submitEnabled = true,
    this.onAdd,
    required this.onSubmit,
  }) : super(key: key);

  final String? addLabel;
  final String? submitLabel;
  final bool addEnabled;
  final bool submitEnabled;
  final Function(String, String)? onAdd;
  final Function(String, String) onSubmit;

  @override
  _GreetFormState createState() => _GreetFormState();
}

class _GreetFormState extends ConsumerState<GreetForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String _firstName;
  late String _lastName;

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen<GreetState>(
      greetStateNotifierProvider,
      (prevState, curState) {
        curState.maybeWhen(
          initial: () {
            _counter = 0;
            formKey.currentState?.reset();
          },
          orElse: () {},
        );
      },
    );

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (fname) => _firstName = fname,
            validator: (fname) {
              if (fname?.isEmpty ?? true) {
                return "Please enter a first name.";
              }
              return null;
            },
            decoration: const InputDecoration(labelText: "Fist Name"),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onChanged: (lname) => _lastName = lname,
            validator: (lname) {
              if (lname?.isEmpty ?? true) {
                return "Please enter a last name";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Last Name",
            ),
          ),
          if (widget.onAdd != null) ...[
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text(widget.addLabel ?? 'Add ($_counter)'),
              onPressed: widget.addEnabled
                  ? () async {
                      if (formKey.currentState!.validate()) {
                        widget.onAdd!(_firstName, _lastName);
                        setState(() {
                          _counter++;
                        });
                      }
                    }
                  : null,
            ),
          ],
          const SizedBox(height: 20),
          ElevatedButton(
            child: Text(widget.submitLabel ?? 'Submit'),
            onPressed: widget.submitEnabled
                ? () async {
                    if (formKey.currentState!.validate()) {
                      widget.onSubmit(_firstName, _lastName);
                      setState(() {
                        _counter = 0;
                      });
                    }
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
