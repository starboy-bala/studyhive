import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  String _name = '';
  String _email = '';

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      _loadUserProfile();
    }
  }

  void _loadUserProfile() async {
    DocumentSnapshot userDoc = await _firestore.collection('users').doc(_user!.uid).get();
    setState(() {
      _name = userDoc['name'] ?? '';
      _email = userDoc['email'] ?? '';
      _nameController.text = _name;
      _emailController.text = _email;
    });
  }

  void _updateProfile() async {
    await _firestore.collection('users').doc(_user!.uid).update({
      'name': _nameController.text,
      'email': _emailController.text,
    });
    setState(() {
      _name = _nameController.text;
      _email = _emailController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name:', style: TextStyle(fontSize: 18)),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Enter your name'),
            ),
            SizedBox(height: 16.0),
            Text('Email:', style: TextStyle(fontSize: 18)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Enter your email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _updateProfile,
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}