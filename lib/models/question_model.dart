/// id : "b6540101-e1d0-4ff0-8449-dae031ed7ed1"
/// question : "How can we manage financial crisis?"

class QuestionModel {
  QuestionModel({
      String? id, 
      String? question,}){
    _id = id;
    _question = question;
}

  QuestionModel.fromJson(dynamic json) {
    _id = json['id'];
    _question = json['question'];
  }
  String? _id;
  String? _question;
QuestionModel copyWith({  String? id,
  String? question,
}) => QuestionModel(  id: id ?? _id,
  question: question ?? _question,
);
  String? get id => _id;
  String? get question => _question;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['question'] = _question;
    return map;
  }

}