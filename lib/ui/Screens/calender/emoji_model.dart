enum EmotionEmojiEnum {
  happy('😀'),
  angry('😡'),
  sad('😔');

  final String emoji;
  const EmotionEmojiEnum(this.emoji);
}

final class DateEmojiModel {
  final EmotionEmojiEnum emotion;
  final DateTime date;

  DateEmojiModel({required this.emotion, required this.date});

  static final List<DateEmojiModel> dummyList = [
    DateEmojiModel(
      emotion: EmotionEmojiEnum.happy,
      date: DateTime.parse('2024-01-03'),
    ),
    DateEmojiModel(
      emotion: EmotionEmojiEnum.angry,
      date: DateTime.parse('2024-01-15'),
    ),
    DateEmojiModel(
      emotion: EmotionEmojiEnum.sad,
      date: DateTime.parse('2024-01-27'),
    ),
  ];
}
