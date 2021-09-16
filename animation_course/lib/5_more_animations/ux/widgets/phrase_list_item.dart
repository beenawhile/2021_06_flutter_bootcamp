import 'package:animation_course/5_more_animations/models/phrase_state.dart';
import 'package:animation_course/5_more_animations/providers/phase_change_notifier.dart';
import 'package:animation_course/5_more_animations/ux/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

class PhraseListItem extends ConsumerStatefulWidget {
  const PhraseListItem({
    Key? key,
    required this.phraseModel,
    required this.index,
    required this.onDismissed,
    required this.undoPressed,
  }) : super(key: key);

  final PhraseModel phraseModel;
  final int index;
  final Function(DismissDirection, int) onDismissed;
  final Function(PhraseModel, int) undoPressed;

  @override
  _PhraseListItemState createState() => _PhraseListItemState();
}

class _PhraseListItemState extends ConsumerState<PhraseListItem> {
  ValueKey firstIconKey = const ValueKey<String>("like");
  ValueKey secondIconKey = const ValueKey<String>("unlike");

  void _onLikePressed() {
    ref.read(phrasesProvider).likeItem(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.phraseModel.phrase),
      onDismissed: (direction) {
        widget.onDismissed(direction, widget.index);
        final snackBar = SnackBar(
          content: const Text("Phrase removed"),
          action: SnackBarAction(
            label: "Undo",
            textColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              widget.undoPressed(widget.phraseModel, widget.index);
            },
          ),
        );
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      background: backgroundGradient(salmon, Colors.transparent),
      secondaryBackground: backgroundGradient(Colors.transparent, mustard),
      child: ListTile(
        title: Text(ReCase(widget.phraseModel.phrase).titleCase),
        subtitle: Text('Number: ${widget.index}'),
        trailing: GestureDetector(
          onTap: _onLikePressed,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.ease,
            switchOutCurve: Curves.easeOut,
            child: widget.phraseModel.like
                ? Icon(
                    Icons.favorite,
                    key: firstIconKey,
                    color: salmon,
                  )
                : Icon(
                    Icons.favorite_border,
                    key: secondIconKey,
                  ),
          ),
        ),
      ),
    );
  }
}
