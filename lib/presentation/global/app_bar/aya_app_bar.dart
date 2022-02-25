// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/internal/services/app_redirects.dart';
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:aya/presentation/global/app_bar/app_bar_back.dart';

class AyaAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AyaAppBar({
    Key? key,
    this.title,
    this.backgroundColor = Colors.transparent,
    this.contentColor = blackColor,
    this.actions,
    this.canPop = true,
    this.bottom,
    this.bottomHeight,
  }) : super(key: key);

  final String? title;
  final Color? backgroundColor;
  final Color? contentColor;
  final bool canPop;
  final List<Widget>? actions;
  final Widget? bottom;
  final double? bottomHeight;

  @override
  _AyaAppBarState createState() => _AyaAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 1.35 + (bottomHeight ?? 0));
}

class _AyaAppBarState extends State<AyaAppBar> {
  static const _appBarHeroTag = 'AppBarHeroTag';

  Widget _buildRowWrapper(BuildContext context, {Widget? child}) {
    return Container(
      height: kToolbarHeight * 1.35,
      color: widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: sidePadding, bottom: sidePadding4, right: sidePadding),
        child: child,
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Row(
      children: [
        AppBarBack(color: widget.contentColor),
        const SizedBox(width: sidePadding16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRowWrapper(
          context,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (canPop(context) && widget.canPop) _buildBackButton(context),
                  if (widget.title != null)
                    Hero(
                      tag: _appBarHeroTag,
                      child: Text(
                        widget.title!,
                        style: Theme.of(context).textTheme.headline4!.copyWith(color: widget.contentColor),
                      ),
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: (widget.actions ?? [])
                    .map((e) => Padding(padding: const EdgeInsets.only(left: sidePadding12), child: e))
                    .toList(),
              ),
            ],
          ),
        ),
        if (widget.bottom != null) widget.bottom!,
      ],
    );
  }
}
