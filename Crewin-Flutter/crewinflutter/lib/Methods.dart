import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crewinflutter/AddFoodInfo.dart';

class Methods{

AddFoodInfo addFoodInfoState=AddFoodInfo();

  AddImageMethod(){
    print("Resim Eklendmei");

  }
  SaveMethod()async {
        final _firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = _firestore.collection("foods");
          Map<String,dynamic> infodata=
          {
            'Name':  addFoodInfoState.FoodName.text,
            'recipe':  addFoodInfoState.Recipe.text,
          };
         await collectionReference.doc(addFoodInfoState.FoodName.text).set(infodata);
        }

}