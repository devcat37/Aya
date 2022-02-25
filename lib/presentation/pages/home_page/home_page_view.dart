// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/domain/mock/mock_recipes.dart';
import 'package:aya/internal/services/service_locator.dart';
import 'package:aya/internal/services/settings.dart';
import 'package:aya/internal/states/user_state/user_state.dart';
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:aya/presentation/global/app_bar/aya_app_bar.dart';
import 'package:aya/presentation/global/user_image/user_image.dart';
import 'package:aya/presentation/widgets/home_page/recipes/aya_recipe_widget.dart';
import 'package:aya/presentation/widgets/home_page/recipes/aya_recipes.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

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
                'Добро пожаловать в',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                Settings.appName,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: sidePadding8),
              Text(
                userState.user!.fullName,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthDiary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Дневник здоровья',
            style: Theme.of(context).textTheme.headline4!.copyWith(color: blackColor),
          ),
          const SizedBox(height: sidePadding32),
        ],
      ),
    );
  }

  Widget _buildRecipes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: sidePadding),
          child: Text(
            'Рецепты',
            style: Theme.of(context).textTheme.headline4!.copyWith(color: blackColor),
          ),
        ),
        const SizedBox(height: sidePadding32),
        AyaRecipes(
          recipes: allMockRecipes.map((e) => AyaRecipeWidget(recipe: e)).toList(),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWelcomeAndImage(context),
        const SizedBox(height: sidePadding32),
        _buildRecipes(context),
        const SizedBox(height: sidePadding32),
        _buildHealthDiary(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AyaAppBar(
        title: 'Главная',
      ),
      body: _buildContent(context),
    );
  }
}
