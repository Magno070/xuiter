import 'package:flutter/material.dart';

import 'package:xuiter/app/auth/repositories/auth_repository.dart';

class VerticalNavigatorViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  VerticalNavigatorViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<bool> logOut() async {
    return _authRepository.logout();
  }
}
