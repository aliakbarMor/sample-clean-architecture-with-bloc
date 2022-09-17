import 'package:eterex/feature/main/domain/entities/users_entity.dart';

import 'user_model.dart';
import 'support_model.dart';

class UsersModel extends UsersEntity {
  UsersModel({
    super.page,
    super.perPage,
    super.total,
    super.totalPages,
    super.data,
    super.support,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        page: json['page'] as int?,
        perPage: json['per_page'] as int?,
        total: json['total'] as int?,
        totalPages: json['total_pages'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        support: json['support'] == null
            ? null
            : SupportModel.fromJson(json['support'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'data': data?.map((e) => e.toJson()).toList(),
        'support': support?.toJson(),
      };
}
