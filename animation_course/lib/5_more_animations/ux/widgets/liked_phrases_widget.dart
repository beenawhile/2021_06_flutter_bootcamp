import 'dart:ui';

import 'package:animation_course/5_more_animations/providers/phase_change_notifier.dart';
import 'package:animation_course/5_more_animations/ux/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recase/recase.dart';

class LikedPhrasesWidget extends StatelessWidget {
  const LikedPhrasesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              salmon.withOpacity(.5),
              Colors.transparent,
            ]),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Consumer(
            builder: (context, ref, child) {
              final phrases = ref.watch(phrasesProvider);
              if (phrases.likedPhases.isEmpty) {
                return Center(
                  child: Text(
                    "Nothing loved yet :(",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                );
              }
              return AnimationLimiter(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          verticalOffset: 200.0,
                          duration: const Duration(milliseconds: 500),
                          child: FadeInAnimation(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                    ReCase(phrases.likedPhases[index].phrase)
                                        .titleCase,
                                    style: const TextStyle(fontSize: 28)),
                              ),
                            ),
                          )),
                    );
                  },
                  itemCount: phrases.likedPhases.length,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
