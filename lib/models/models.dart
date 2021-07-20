class Emotion {
  final double joy;
  final double sadness;
  final double anger;
  final double fear;
  final double love;
  final double surprise;

  Emotion({this.joy = 0.0, this.sadness = 0.0, this.anger = 0.0, this.fear = 0.0, this.love = 0.0,
      this.surprise = 0.0});

  static Emotion fromJson(var json) {
    return Emotion(
      joy: json['joy'],
      sadness: json['sadness'],
      anger: json['anger'],
      love: json['love'],
      fear: json['fear'],
      surprise: json['surprise'],
    );
  }

  Map<String, double> toJson() {
    return <String, double>{
      "joy": joy,
      "sadness": sadness,
      "anger": anger,
      "love": love,
      "fear": fear,
      "surprise": surprise,
    };
  }
}
