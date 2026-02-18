import 'package:m4_user/data/models/base_model.dart';

class FaqModel extends BaseModel {
  final int id;
  final String question;
  final String answer;
  final int isActive;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.isActive,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'],
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
      isActive: json['is_active'] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'is_active': isActive,
    };
  }
}
