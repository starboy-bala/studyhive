class Announcement {
  final String id;
  final String subject;
  final String details;
  final DateTime time;
  final User creator;

  Announcement({
    required this.id,
    required this.subject,
    required this.details,
    required this.time,
    required this.creator,
  });
}
