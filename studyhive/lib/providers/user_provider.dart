import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [
    User(id: '1', name: 'Alice'),
    User(id: '2', name: 'Bob'),
  ];

  List<User> get users => _users;

  void addFriend(User user) {
    user.isFriend = true;
    notifyListeners();
  }
}
