import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crewinflutter/AddFoodInfo.dart';
import 'package:crewinflutter/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final FirebaseFirestore firestore;
  late final CollectionReference collectionReferenceFoods;

  @override
  void initState() {
    super.initState();
    firestore = FirebaseFirestore.instance;
    collectionReferenceFoods = firestore.collection("foods");
    debugPrint("dd");

  }
  WidgetClass Widgets = WidgetClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Widgets.AppBarText),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: collectionReferenceFoods.snapshots(), 
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                List listOfDocumentSnap =asyncSnapshot.data.docs;
                return Flexible(
                  child: ListView.builder(
                    itemCount: listOfDocumentSnap.length, 
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            '${listOfDocumentSnap.length}',
                            style: TextStyle(fontSize: 24),
                          ),
                          //-----
                          trailing: IconButton(
                          iconSize: 40,
                          color: Colors.red[900],
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await listOfDocumentSnap[index].reference.delete();
                          },
                        ),
                          subtitle: null,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddFoodInfo()));
          },
          label: Widgets.YemekEkleText()),
    );
  }
}
