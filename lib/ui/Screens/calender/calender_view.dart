import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_detection/ui/Screens/calender/emoji_model.dart';
import 'package:kartal/kartal.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  final List<DateEmojiModel> dataList = DateEmojiModel.dummyList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Calendar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.yellowAccent.shade700,
      ),
      body: Column(
        children: [
          SafeArea(
            child: CalendarDatePicker2(
              config: CalendarDatePicker2WithActionButtonsConfig(
                dayBuilder: _dayBuilder,
                weekdayLabelTextStyle:
                    context.general.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              value: [],
              onValueChanged: (value) {},
            ),
          ),
          Image.asset(
            'assets/images/calendar.png',
            width: 180,
            height: 180,
          ),
          const Text(
            'How\'s your day going',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget? _dayBuilder({
    required DateTime date,
    TextStyle? textStyle,
    BoxDecoration? decoration,
    bool? isSelected,
    bool? isDisabled,
    bool? isToday,
  }) {
    if (isSelected == null) return SizedBox.shrink();
    final timestamp = 123123;
    final DateTime dateTimeFromFirebase =
        DateTime.fromMillisecondsSinceEpoch(timestamp);
    final DateTime todayDate = DateTime.now();
    final String? emoji = _getDateEmoji(date);
    return InkWell(
      onTap: () async {
        final size = context.size;
        if (size == null) return;
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: size.height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: EmotionEmojiEnum.values
                    .map(
                      (e) => TextButton(
                        child: Text(
                          e.emoji,
                          style: context.general.textTheme.displayLarge,
                        ),
                        onPressed: () {
                          final DateEmojiModel model = DateEmojiModel(
                            emotion: e,
                            date: date,
                          );

                          dataList.add(model);
                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          emoji != null
              ? Text(
                  emoji,
                  style: context.general.textTheme.titleLarge,
                )
              : Text(
                  date.day.toString(),
                  style: context.general.textTheme.titleMedium,
                ),
        ],
      ),
    );
  }

  String? _getDateEmoji(DateTime date) {
    final List<DateTime> dateList = dataList.map((e) => e.date).toList();
    int foundIndex = -1;
    for (int i = 0; i < dateList.length; i++) {
      if (dateList[i].compareTo(date) == 0) {
        foundIndex = i;
        break;
      }
    }

    if (foundIndex == -1) return null;
    return dataList[foundIndex].emotion.emoji;
  }
}
