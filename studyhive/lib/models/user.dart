class User {
  final String id;
  final String name;
  bool isFriend;

  User({required this.id, required this.name, this.isFriend = false});
}
