import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

import '../../domain/entities/activity.dart';
import '../bloc/activity_bloc.dart';

class ActivityLikeButton extends StatelessWidget {
  const ActivityLikeButton({
    super.key,
    required this.activity,
    this.buttonSize = 30.0,
  });

  final ActivityEntity activity;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleColor = theme.textTheme.headlineMedium?.color;
    return LikeButton(
      padding: const EdgeInsets.all(8.0),
      isLiked: activity.isFavorite,
      size: buttonSize,
      circleColor: CircleColor(
          start: theme.colorScheme.primary, end: theme.colorScheme.primary),
      bubblesColor: BubblesColor(
        dotPrimaryColor: theme.colorScheme.primary,
        dotSecondaryColor: theme.colorScheme.secondary,
      ),
      likeBuilder: (bool isLiked) {
        return isLiked
            ? Icon(Icons.favorite_rounded, color: titleColor, size: buttonSize)
            : Icon(
                Icons.favorite_outline_rounded,
                color: Colors.grey,
                size: buttonSize,
              );
      },
      onTap: (isLiked) async {
        context.read<ActivityBloc>().add(
              ActivityUpdated(
                activityId: activity.id,
                isFavorite: !isLiked,
              ),
            );
        return !isLiked;
      },
    );
  }
}
