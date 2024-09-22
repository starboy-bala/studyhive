import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Friends')),
      body: Consumer<UserProvider>(
        builder: (ctx, userProvider, _) => ListView.builder(
          itemCount: userProvider.users.length,
          itemBuilder: (ctx, i) => ListTile(
            title: Text(userProvider.users[i].name),
            trailing: IconButton(
              icon: userProvider.users[i].isFriend
                  ? Icon(Icons.check, color: Colors.green)
                  : Icon(Icons.person_add),
              onPressed: () {
                userProvider.addFriend(userProvider.users[i]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
