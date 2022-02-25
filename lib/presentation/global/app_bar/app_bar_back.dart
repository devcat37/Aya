// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/internal/services/app_redirects.dart';
import 'package:aya/internal/utils/infrastructure.dart';

class AppBarBack extends StatelessWidget {
  const AppBarBack({Key? key, this.color = blackColor}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => pop(context),
      child: Icon(
        Icons.arrow_back_ios,
        color: color,
      ),
    );
  }
}
