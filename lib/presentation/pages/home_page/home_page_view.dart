import 'package:aya/presentation/global/app_bar/aya_app_bar.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AyaAppBar(
        title: 'Главная',
      ),
    );
  }
}
