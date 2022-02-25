// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/internal/services/service_locator.dart';
import 'package:aya/internal/services/settings.dart';
import 'package:aya/internal/states/user_state/user_state.dart';
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:aya/presentation/global/app_bar/aya_app_bar.dart';
import 'package:aya/presentation/global/user_image/user_image.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  UserState get userState => service<UserState>();

  Widget _buildWelcomeAndImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Row(
        children: [
          UserImage.fromUser(user: userState.user!),
          const SizedBox(width: sidePadding18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${userState.user!.name}\n${userState.user!.surname}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserInformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: UserImage.fromUser(
            user: userState.user!,
            size: 90.0,
          ),
        ),
        const SizedBox(height: sidePadding32),
        _buildUserInformation(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AyaAppBar(
        title: 'Профиль',
      ),
      body: _buildContent(context),
    );
  }
}
