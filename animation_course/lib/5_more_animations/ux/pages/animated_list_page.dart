import 'dart:async';

import 'package:animation_course/5_more_animations/models/phrase_state.dart';
import 'package:animation_course/5_more_animations/providers/phase_change_notifier.dart';
import 'package:animation_course/5_more_animations/ux/widgets/liked_phrases_widget.dart';
import 'package:animation_course/5_more_animations/ux/widgets/menu_popup_button.dart';
import 'package:animation_course/5_more_animations/ux/widgets/menu_transition_example.dart';
import 'package:animation_course/5_more_animations/ux/widgets/phrase_list_item.dart';
import 'package:animation_course/5_more_animations/ux/widgets/rotate_scale_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nil/nil.dart';

class AnimatedListPage extends ConsumerStatefulWidget {
  const AnimatedListPage({Key? key}) : super(key: key);

  @override
  _AnimatedListPageState createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends ConsumerState<AnimatedListPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _menuAnimation;

  final _listKey = GlobalKey<AnimatedListState>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onMenuPress() {
    if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    } else if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.forward) {
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.reverse) {
      _controller.forward();
    }
  }

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _menuAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    );
  }

  void _addRandomItemToList() {
    ref.read(phrasesProvider).addRandomItemToList();
    _listKey.currentState!.insertItem(ref.watch(phrasesProvider).length - 1);
  }

  void _addItemToList(PhraseModel phrase, int index) {
    ref.read(phrasesProvider).addItemToList(phrase, index);
    _listKey.currentState!.insertItem(index);
  }

  void _removeItemFromList(int index) {
    ref.read(phrasesProvider).removeItemFromList(index);
    _listKey.currentState!.removeItem(index, (_, animation) => nil);
  }

  void _scrollListToBottom() {
    Timer(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phrase Generator"),
        leading: IconButton(
          onPressed: _onMenuPress,
          icon: AnimatedIcon(
            progress: _menuAnimation,
            icon: AnimatedIcons.menu_close,
          ),
        ),
        actions: const <Widget>[
          MenuPopupButton(),
        ],
      ),
      floatingActionButton: RotateScaleTransition(
        animation: _menuAnimation,
        child: FloatingActionButton(
          onPressed: _addRandomItemToList,
          child: const Icon(Icons.add),
        ),
      ),
      body: Stack(
        children: [
          AnimatedList(
              controller: _scrollController,
              key: _listKey,
              initialItemCount: ref.watch(phrasesProvider).length,
              itemBuilder: (_, index, animation) {
                return ScaleTransition(
                  scale: animation.drive(
                    CurveTween(curve: Curves.easeOut),
                  ),
                  child: PhraseListItem(
                    phraseModel: ref.watch(phrasesProvider).phases[index],
                    undoPressed: _addItemToList,
                    index: index,
                    onDismissed: (direction, index) {
                      _removeItemFromList(index);
                    },
                  ),
                );
              }),
          MenuTransitionExample(
            animation: _controller.view,
            child: const LikedPhrasesWidget(),
          ),
        ],
      ),
    );
  }
}
