import 'package:flutter_riverpod/flutter_riverpod.dart';

enum UserType { client, cleaner }

class UserTypeNotifier extends Notifier<UserType> {
  @override
  UserType build() => UserType.client;

  void setUserType(UserType type) {
    state = type;
  }
}

final userTypeProvider = NotifierProvider<UserTypeNotifier, UserType>(
  UserTypeNotifier.new,
);
