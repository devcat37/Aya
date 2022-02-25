// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aya/internal/pages/home_page/home_page.dart';
import 'package:aya/internal/pages/profile_page/profile_page.dart';
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:aya/presentation/global/app_bar/aya_app_bar.dart';
import 'package:aya/presentation/global/bottom_app_bar_item/bottom_app_bar_item.dart';
import 'package:aya/presentation/global/icons/aya_icons.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key}) : super(key: key);

  static const routeName = '/workspace';

  @override
  _WorkspaceState createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  static const _initialPage = 0;

  final PageController _pageController = PageController(initialPage: _initialPage);
  int _currentIndex = 0;

  /// Словарь элементов в bottom app bar к экранам приложения.
  Map<BottomAppBarItem, Widget> itemToPage(BuildContext context) {
    return {
      BottomAppBarItem(
        icon: AyaIcons.home,
        activeIcon: AyaIcons.so_home,
        isActive: _currentIndex == 0,
      ): const HomePage(),
      BottomAppBarItem(
        icon: AyaIcons.user,
        activeIcon: AyaIcons.user_so,
        isActive: _currentIndex == 1,
      ): const ProfilePage(),
    };
  }

  double _itemPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = itemToPage(context).keys.isNotEmpty ? BottomAppBarItem.defaultWidth + sidePadding18 : null;
    final itemPadding =
        (screenWidth - itemToPage(context).keys.length * (itemWidth ?? 0)) / (itemToPage(context).keys.length + 1);

    return itemPadding;
  }

  /// Оболочка над item в bottom app bar.
  Widget _itemWrapper(BottomAppBarItem item) {
    return Container(
      height: BottomAppBarItem.defaultWidth + sidePadding18,
      width: BottomAppBarItem.defaultWidth + sidePadding18,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius32,
        child: InkResponse(
          onTap: () {
            final index = itemToPage(context).keys.toList().indexWhere((i) => i.icon.codePoint == item.icon.codePoint);
            if (index != _currentIndex) {
              setState(() {
                if ((_currentIndex - index).abs() > 1) {
                  _pageController.jumpToPage(index);
                } else {
                  _pageController.animateToPage(
                    index,
                    duration: halfASecond * 0.5,
                    curve: Curves.decelerate,
                  );
                }

                _currentIndex = index;
              });
            }
          },
          customBorder: const CircleBorder(),
          highlightColor: Colors.black12,
          splashColor: Colors.transparent,
          child: item,
        ),
      ),
    );
  }

  Widget _buildMicrophoneButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: borderRadius32,
        child: Ink(
          height: 75.0,
          width: 75.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: mainGreenColor,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: greenButtonGradient,
            ),
          ),
          child: const Center(
            child: Icon(Icons.mic, color: whiteColor, size: sidePadding28),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: itemToPage(context).values.toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildMicrophoneButton(context),
      bottomNavigationBar: BottomAppBar(
        // elevation: 0.0,
        elevation: 52.0,
        shape: const CircularNotchedRectangle(),
        notchMargin: sidePadding8,
        child: SizedBox(
          height: 80.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: sidePadding48),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(itemToPage(context).keys.length, (index) {
                final item = itemToPage(context).keys.elementAt(index);

                final padding = index != itemToPage(context).keys.length - 1 ? _itemPadding(context) : 0.0;
                return Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: _itemWrapper(item),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
