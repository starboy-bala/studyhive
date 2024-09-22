import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/announcement_provider.dart';
import '../models/announcement.dart';
import '../models/user.dart';

class AnnouncementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Study Announcements')),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AnnouncementProvider>(
              builder: (ctx, announcementProvider, _) => ListView.builder(
                itemCount: announcementProvider.announcements.length,
                itemBuilder: (ctx, i) => ListTile(
                  title: Text(announcementProvider.announcements[i].subject),
                  subtitle: Text(announcementProvider.announcements[i].details),
                  trailing: IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      // Implement chat initiation
                    },
                  ),
                ),
              ),
            ),
          ),
          AnnouncementInputForm(),
        ],
      ),
    );
  }
}

class AnnouncementInputForm extends StatefulWidget {
  @override
  _AnnouncementInputFormState createState() => _AnnouncementInputFormState();
}

class _AnnouncementInputFormState extends State<AnnouncementInputForm> {
  final _subjectController = TextEditingController();
  final _detailsController = TextEditingController();

  void _submitData() {
    if (_subjectController.text.isEmpty || _detailsController.text.isEmpty) return;

    Provider.of<AnnouncementProvider>(context, listen: false).addAnnouncement(
      Announcement(
        id: DateTime.now().toString(),
        subject: _subjectController.text,
        details: _detailsController.text,
        time: DateTime.now(),
        creator: User(id: '1', name: 'Alice'), // Hardcoded for now
      ),
    );

    _subjectController.clear();
    _detailsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Subject'),
              controller: _subjectController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Details'),
              controller: _detailsController,
            ),
            ElevatedButton(
              child: Text('Add Announcement'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
