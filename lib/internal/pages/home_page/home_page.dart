import 'package:aya/presentation/pages/home_page/home_page_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}
