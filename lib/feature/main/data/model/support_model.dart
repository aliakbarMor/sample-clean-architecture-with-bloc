import 'package:eterex/feature/main/domain/entities/support_Entity.dart';

class SupportModel extends SupportEntity {
  SupportModel({
    super.url,
    super.text,
  });

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        url: json['url'] as String?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'text': text,
      };
}
