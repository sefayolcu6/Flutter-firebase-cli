import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crewinflutter/Methods.dart';
import 'package:crewinflutter/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddFoodInfo extends StatefulWidget {
  TextEditingController FoodName = TextEditingController();
  TextEditingController Recipe = TextEditingController();
  AddFoodInfo({super.key});

  @override
  State<AddFoodInfo> createState() => _AddFoodInfoState();
}

class _AddFoodInfoState extends State<AddFoodInfo> {
  WidgetClass _widgets = WidgetClass();
  Methods _methods = Methods();
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = _firestore.collection("food");

    return Scaffold(
      appBar: AppBar(title: _widgets.AppBarText),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            _widgets.TextFormFields(widget.FoodName, "Yemek Adı"),
            _widgets.TextFormFields(widget.Recipe, "Yemeğin Tarifi"),
            ElevatedButton(
                onPressed: () {
                  _methods.AddImageMethod();
                },
                child: _widgets.ResimEkleText())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final _firestore = FirebaseFirestore.instance;
          CollectionReference collectionReference =
              _firestore.collection("foods");
          Map<String, dynamic> infodata = {
            'Name': widget.FoodName.text,
            'recipe': widget.Recipe.text,
          };
          await collectionReference.doc(widget.FoodName.text).set(infodata);
        },
        label: _widgets.KaydetText(),
      ),
    );
  }
}
