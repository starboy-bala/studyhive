import 'package:flutter/material.dart';
import './announcement_screen.dart';
import './friend_screen.dart';
import './chat_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StudyHive')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Announcements'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AnnouncementScreen(),
                ));
              },
            ),
            ElevatedButton(
              child: Text('Friends'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FriendScreen(),
                ));
              },
            ),
            ElevatedButton(
              child: Text('Chat'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
