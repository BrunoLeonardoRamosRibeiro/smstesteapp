import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(child: Text('Home Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _auth.signOut();
          Get.back();
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
