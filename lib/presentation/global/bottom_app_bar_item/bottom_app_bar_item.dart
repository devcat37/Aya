// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/internal/utils/infrastructure.dart';

class BottomAppBarItem extends StatefulWidget {
  BottomAppBarItem({
    Key? key,
    required this.icon,
    required this.activeIcon,
    this.activeColor = mainGreenColor,
    this.isActive = false,
  }) : super(key: key);

  static const double defaultWidth = 28.0;

  final IconData icon;
  final IconData activeIcon;
  final Color activeColor;

  bool isActive = false;

  @override
  _BottomAppBarItemState createState() => _BottomAppBarItemState();
}

class _BottomAppBarItemState extends State<BottomAppBarItem> {
  bool get isActive => widget.isActive;

  @override
  Widget build(BuildContext context) {
    return Icon(
      isActive ? widget.activeIcon : widget.icon,
      size: BottomAppBarItem.defaultWidth,
      color: isActive ? widget.activeColor : lightGreyColor,
    );
  }
}
