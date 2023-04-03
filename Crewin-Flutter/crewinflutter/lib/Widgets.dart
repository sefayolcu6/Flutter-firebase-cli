import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetClass<Widget> {
  Text AppBarText = Text(
    "Crewin Food",
    style: TextStyle(color: Colors.white),
  );
  Padding TextFormFields(TextEditingController Controllers, String Text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: Controllers,
        decoration: InputDecoration(
          hintText: Text,
          suffixIcon: IconButton(
            onPressed: Controllers.clear,
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
    );
  }

  Text KaydetText() => Text("Kaydet");
  Text YemekEkleText() => Text("Yemek Ekle");
  Text ResimEkleText() => Text("Resim Ekle");
}
