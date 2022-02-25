// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/domain/models/recipe/aya_recipe.dart';
import 'package:aya/internal/utils/infrastructure.dart';

class AyaRecipeWidget extends StatelessWidget {
  const AyaRecipeWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  static const defaultBannerHeight = 180.0;

  final AyaRecipe recipe;

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding64),
      child: Text(
        recipe.subtitle.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: whiteColor, fontSize: 10.0, letterSpacing: 2.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Text(
        recipe.title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: whiteColor, fontSize: 20.0, height: 24 / 20),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOverlayGradient(BuildContext context) {
    return Container(
      height: AyaRecipeWidget.defaultBannerHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius32,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            blackColor.withOpacity(0.6),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: borderRadius32,
        child: Ink(
          height: AyaRecipeWidget.defaultBannerHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: lightGreyColor, borderRadius: borderRadius32, boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.15),
              blurRadius: 16.0,
              offset: const Offset(12, 12),
            ),
          ]),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: borderRadius32,
                child: recipe.asset.isNotEmpty ? Image.asset(recipe.asset, fit: BoxFit.cover) : const SizedBox.shrink(),
              ),
              _buildOverlayGradient(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSubtitle(context),
                  const SizedBox(height: sidePadding10),
                  _buildTitle(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
