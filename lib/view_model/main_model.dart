import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum AuthState {
  initialized,
  loading,
}

const kAuthBoxKey = 'Auth';
const kGetUser = 'user';

class MainModel extends ChangeNotifier {
  final _state = AuthState.loading;
  User user;
  loadState() {
    user = Hive.box(kAuthBoxKey).get(kGetUser);
  }
}
