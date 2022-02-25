// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/domain/models/user/user.dart';
import 'package:aya/internal/services/helpers.dart';
import 'package:aya/internal/utils/infrastructure.dart';

class UserImage extends StatelessWidget {
  UserImage.fromUser({
    Key? key,
    required User user,
    this.size = defaultSize,
  })  : username = user.name,
        super(key: key);

  static const defaultSize = 75.0;

  final double size;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: mainGreenColor,
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // colors: usernameToGradient(username),
          colors: greenImageGradient,
        ),
      ),
      child: Center(
        child: Text(
          username[0].toUpperCase(),
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: whiteColor,
            fontWeight: FontWeight.w200,
            fontSize: 28 * size / defaultSize,
            shadows: [
              Shadow(
                offset: const Offset(2.0, 2.0),
                blurRadius: 2.0,
                color: greyTextColor.withOpacity(0.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
