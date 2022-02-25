// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';

// Project imports:
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:aya/presentation/global/carousel_progress/carousel_progress.dart';
import 'package:aya/presentation/widgets/home_page/recipes/aya_recipe_widget.dart';

class AyaRecipes extends StatefulWidget {
  const AyaRecipes({Key? key, required this.recipes}) : super(key: key);

  final List<AyaRecipeWidget> recipes;

  @override
  State<AyaRecipes> createState() => _AyaRecipesState();
}

class _AyaRecipesState extends State<AyaRecipes> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: AyaRecipeWidget.defaultBannerHeight + sidePadding12 + sidePadding10,
      child: Column(
        children: [
          CarouselSlider(
            items: widget.recipes,
            options: CarouselOptions(
              height: AyaRecipeWidget.defaultBannerHeight,
              autoPlay: true,
              enlargeCenterPage: true,

              // Callback при смене элемента в carousel.
              onPageChanged: (index, _) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: sidePadding12),
          CarouselProgress(
            pagesCount: widget.recipes.length,
            currentPage: _currentIndex,
          ),
        ],
      ),
    );
  }
}
