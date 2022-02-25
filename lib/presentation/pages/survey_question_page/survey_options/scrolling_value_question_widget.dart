// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

// Project imports:
import 'package:aya/domain/models/question/scrolling_double_value_question.dart';
import 'package:aya/internal/services/helpers.dart';
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:aya/presentation/pages/survey_question_page/survey_question__header.dart';

class ScrollingValueQuestionWidget extends StatefulWidget {
  const ScrollingValueQuestionWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  final ScrollingDoubleValueQuestion question;

  @override
  _ScrollingValueQuestionWidgetState createState() => _ScrollingValueQuestionWidgetState();
}

class _ScrollingValueQuestionWidgetState extends State<ScrollingValueQuestionWidget> {
  static const double minValueSize = 52.0;
  static const double maxValueSize = 96.0;

  static const style =
      TextStyle(fontFamily: 'Inter', fontSize: maxValueSize, fontWeight: FontWeight.w500, color: blackColor);

  final ScrollController _scrollControllerFirst = ScrollController();
  final ScrollController _scrollControllerSecond = ScrollController();

  bool get isScrolling =>
      _scrollControllerFirst.position.isScrollingNotifier.value ||
      _scrollControllerSecond.position.isScrollingNotifier.value;

  late double screenCenterPosition;
  int indexOfMiddleElementFirst = 0;
  int indexOfMiddleElementSecond = 0;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      screenCenterPosition = (MediaQuery.of(context).size.height - SurveyQuestionHeader.defaultHeight) / 2;

      _scrollControllerFirst.addListener(() {
        setState(() {
          indexOfMiddleElementFirst = (_scrollControllerFirst.offset / getTextWidgetSize('5', style).height)
              .round()
              .clamp(0, widget.question.valuesOne.length - 1);
        });

        _scrollListener(_scrollControllerFirst, indexOfMiddleElementFirst);
      });
      _scrollControllerSecond.addListener(() {
        setState(() {
          indexOfMiddleElementSecond = (_scrollControllerSecond.offset / getTextWidgetSize('5', style).height)
              .round()
              .clamp(0, widget.question.valuesTwo.length - 1);
        });

        _scrollListener(_scrollControllerSecond, indexOfMiddleElementSecond);
      });

      _scrollControllerFirst.jumpTo(screenCenterPosition);
      _scrollControllerSecond.jumpTo(screenCenterPosition);

      Future.delayed(defaultAnimationDuration, () {
        _maybeCenterValue(_scrollControllerFirst, indexOfMiddleElementFirst);
        _maybeCenterValue(_scrollControllerSecond, indexOfMiddleElementSecond);
      });
    });
  }

  void _scrollListener(ScrollController controller, int indexOfMiddleElement) {
    Future.delayed(
      const Duration(milliseconds: 100),
      () => _maybeCenterValue(controller, indexOfMiddleElement),
    );
  }

  void _maybeCenterValue(ScrollController controller, int indexOfMiddleElement) {
    if (!isScrolling) {
      final currentScrollingOffset = controller.offset;
      final offsetForIndex = indexOfMiddleElement * getTextWidgetSize('5', style).height;

      if (currentScrollingOffset > offsetForIndex - getTextWidgetSize('5', style).height &&
          currentScrollingOffset < offsetForIndex + getTextWidgetSize('5', style).height) {
        controller.animateTo(offsetForIndex.toDouble(),
            duration: defaultAnimationDuration * 0.5, curve: Curves.decelerate);
      }
    }
  }

  Widget _buildContent(BuildContext context) {
    return Flexible(
      child: Stack(
        children: [
          Row(
            children: [
              const Expanded(child: SizedBox.shrink()),
              Expanded(
                flex: 14,
                child: ListView.builder(
                  controller: _scrollControllerFirst,
                  padding: EdgeInsets.symmetric(
                      vertical: (MediaQuery.of(context).size.height - SurveyQuestionHeader.defaultHeight) / 2 -
                          getTextWidgetSize('5', style).height / 2),
                  itemCount: widget.question.valuesOne.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.question.valuesOne.elementAt(index),
                          style: style.copyWith(
                            color: blackColor.withOpacity((1 -
                                    (index * getTextWidgetSize('5', style).height - _scrollControllerFirst.offset)
                                            .abs() /
                                        ((MediaQuery.of(context).size.height -
                                                SurveyQuestionHeader.defaultHeight +
                                                getTextWidgetSize('5', style).height) /
                                            2))
                                .clamp(0, 1)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(widget.question.separatorSymbol, style: style),
                ),
              ),
              Expanded(
                flex: 14,
                child: ListView.builder(
                  controller: _scrollControllerSecond,
                  padding: EdgeInsets.symmetric(
                      vertical: (MediaQuery.of(context).size.height - SurveyQuestionHeader.defaultHeight) / 2 -
                          getTextWidgetSize('5', style).height / 2),
                  itemCount: widget.question.valuesTwo.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.question.valuesTwo.elementAt(index),
                          style: style.copyWith(
                            color: blackColor.withOpacity((1 -
                                    (index * getTextWidgetSize('5', style).height - _scrollControllerSecond.offset)
                                            .abs() /
                                        ((MediaQuery.of(context).size.height -
                                                SurveyQuestionHeader.defaultHeight +
                                                getTextWidgetSize('5', style).height) /
                                            2))
                                .clamp(0, 1)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
          // _buildFadeWidget(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }
}
