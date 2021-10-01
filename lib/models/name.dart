import 'dart:typed_data';

class Name {

  int _id;
  String _name;
  int _level;
  int _question;
  int _totalScore;
  int _scoreLevel;
  int _timer;

  Name(this._name, this._level, this._question, this._totalScore, this._scoreLevel, this._timer);

  Name.withId(this._id, this._name, this._level, this._question, this._totalScore, this._scoreLevel, this._timer);

  String get name => _name;

  int get id => _id;

  int get level => _level;

  int get question => _question;

  int get totalScore => _totalScore;

  int get scoreLevel => _scoreLevel;

  int get timer => _timer;

  set name(String value) {
    if (value.length <= 255) {
      _name = value;
    }
  }

  set level(int newLevel) {
    if (newLevel >= 1 && newLevel <= 10) {
      this._level = newLevel;
    }
  }

  set question(int newQuestion) {
    if (newQuestion >= 0 && newQuestion <= 100) {
      this._question = newQuestion;
    }
  }

  set totalScore(int newTotalScore) {
    if (newTotalScore >= 0 && newTotalScore <= 100) {
      this._totalScore = newTotalScore;
    }
  }

  set scoreLevel(int newScoreLevel) {
    if (newScoreLevel >= 0 && newScoreLevel <= 10) {
      this._scoreLevel = newScoreLevel;
    }
  }

  set timer(int newTimer) {
    if (newTimer >= 0 && newTimer <= 1) {
      this._timer = newTimer;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map["name"] = this._name;
    map['level'] = _level;
    map['question'] = _question;
    map['totalScore'] = _totalScore;
    map['scoreLevel'] = _scoreLevel;
    map['timer'] = _timer;
    return map;
  }

  Name.getMap(Map<String, dynamic> map){
    this._id = map["id"];
    this._name = map["name"];
    this._level = map['level'];
    this._question = map['question'];
    this._totalScore = map['totalScore'];
    this._scoreLevel = map['scoreLevel'];
    this._timer = map['timer'];
  }
}