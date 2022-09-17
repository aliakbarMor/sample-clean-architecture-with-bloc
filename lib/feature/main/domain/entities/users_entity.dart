import 'package:eterex/feature/main/data/model/support_model.dart';
import 'package:eterex/feature/main/data/model/user_model.dart';

class UsersEntity {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserModel>? data;
  SupportModel? support;

  UsersEntity({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });
}
