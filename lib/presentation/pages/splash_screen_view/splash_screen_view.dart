import 'package:aya/internal/services/app_redirects.dart';
import 'package:aya/internal/services/settings.dart';
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  // Функция initState вызывается ОДИН РАЗ как только пользователь попадает на экран SplashScreenView.
  // Этой функции нет у наследников класса StatelessWidget, и есть только у наследников класса State у Stateful виджетов.
  @override
  void initState() {
    super.initState();

    // Коллбэка addPostFrameCallback, который вызывается сразу же после отрисовки последнего кадра.
    // т.е, как только отрисуются все кадры на экране, вызовется функция внутри.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      // Задержка для показа Splash screen на 3 секунды.
      await Future.delayed(aSecond * 3);

      // Ежедневный опрос о здоровье. После него переход на главную страницу.
      await goToHealthSurveyPage(context);

      // Переход на главную страницу после прохождения ежедневного опроса.
      goToMainPage(context);
    });
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sidePadding64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: sidePadding32),
            Text(
              Settings.appName.toUpperCase(),
              style: Theme.of(context).textTheme.headline1!.copyWith(color: blackColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
    );
  }
}
