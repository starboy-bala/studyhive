import 'package:flutter/material.dart';
import '../models/announcement.dart';
// ignore: unused_import
import '../models/user.dart';

class AnnouncementProvider with ChangeNotifier {
  List<Announcement> _announcements = [];

  List<Announcement> get announcements => _announcements;

  void addAnnouncement(Announcement announcement) {
    _announcements.add(announcement);
    notifyListeners();
  }
}
