import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String title;
  String des;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[700]),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios_outlined)),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[700]),
                        ),
                        onPressed: () {
                          add();
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'lato',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))
                  ],
                ),
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Title',
                    ),
                    style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: 'lato',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    onChanged: (_val) {
                      title = _val;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Note Description',
                    ),
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'lato',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    onChanged: (_val) {
                      des = _val;
                    },
                    maxLines: 20,
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  void add() async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('notes');

    var data = {'title': title, 'description': des, 'created': DateTime.now()};

    ref.add(data);

    Navigator.pop(context);
  }
}
