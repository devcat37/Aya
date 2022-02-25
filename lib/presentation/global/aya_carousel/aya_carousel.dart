// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Project imports:
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:aya/presentation/global/carousel_progress/carousel_progress.dart';

// Package imports:
// Project imports:

class AyaCarousel extends StatefulWidget {
  const AyaCarousel({
    Key? key,
    this.items = const [],
    this.activeDotColor = mainGreenColor,
  }) : super(key: key);

  final List<Widget> items;
  final Color activeDotColor;

  @override
  _AyaCarouselState createState() => _AyaCarouselState();
}

class _AyaCarouselState extends State<AyaCarousel> {
  final PageController controller = PageController();

  Widget _buildCarousel(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: sidePadding),
        decoration: BoxDecoration(
          borderRadius: borderRadius12,
          color: greyTextColor,
        ),
        child: ClipRRect(
          borderRadius: borderRadius12,
          child: PageView(
            controller: controller,
            children: widget.items,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarousel(context),
        const SizedBox(height: sidePadding12),
        SmoothPageIndicator(
          controller: controller,
          count: widget.items.length,
          effect: WormEffect(
            activeDotColor: widget.activeDotColor,
            dotColor: lightGreyColor,
            dotHeight: CarouselProgress.defaultSize,
            dotWidth: CarouselProgress.defaultSize,
            spacing: sidePadding6,
          ),
        ),
      ],
    );
  }
}
