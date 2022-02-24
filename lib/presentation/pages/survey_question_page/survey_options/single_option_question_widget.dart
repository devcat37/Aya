import 'package:aya/domain/models/question/question_option.dart';
import 'package:aya/domain/models/question/single_option_question.dart';
import 'package:aya/internal/utils/infrastructure.dart';
import 'package:flutter/material.dart';

class SingleOptionQuestionWidget extends StatefulWidget {
  const SingleOptionQuestionWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  final SingleOptionQuestion question;

  @override
  State<SingleOptionQuestionWidget> createState() => _SingleOptionQuestionWidgetState();
}

class _SingleOptionQuestionWidgetState extends State<SingleOptionQuestionWidget> {
  Widget _buildOption(BuildContext context, {required QuestionOption option}) {
    final bool isChosen = widget.question.chosenOption == widget.question.options.indexOf(option);

    return InkWell(
      onTap: () => setState(() {
        widget.question.chooseOption(option);
      }),
      borderRadius: borderRadius16,
      child: AnimatedContainer(
        duration: defaultAnimationDuration,
        height: 50.0,
        width: MediaQuery.of(context).size.width - sidePadding * 2,
        decoration: BoxDecoration(
          borderRadius: borderRadius16,
          border: Border.all(width: sidePadding2, color: isChosen ? mainGreenColor : lightSurfaceColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: sidePadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                option.text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: isChosen ? chosenOptionColor : defaultOptionColor),
              ),
              AnimatedContainer(
                duration: defaultAnimationDuration,
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isChosen ? mainGreenColor : Colors.transparent,
                  border: Border.all(width: 2.0, color: isChosen ? chosenOptionColor : defaultOptionColor),
                ),
                child:
                    isChosen ? const Icon(Icons.done, size: sidePadding16, color: whiteColor) : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(sidePadding),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildOption(context, option: widget.question.options.elementAt(index));
      },
      separatorBuilder: (_, __) => const SizedBox(height: sidePadding16),
      itemCount: widget.question.options.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }
}
