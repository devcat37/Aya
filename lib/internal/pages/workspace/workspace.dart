import 'package:aya/internal/pages/home_page/home_page.dart';
import 'package:aya/presentation/global/app_bar/aya_app_bar.dart';
import 'package:flutter/material.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key}) : super(key: key);

  static const routeName = '/workspace';

  @override
  _WorkspaceState createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  /// Словарь элементов в bottom app bar к экранам приложения.
  Map<Widget, Widget> itemToPage(BuildContext context) {
    return {
      Scaffold(): const HomePage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: itemToPage(context).values.toList(),
      ),
      bottomNavigationBar: null,
    );
  }
}
