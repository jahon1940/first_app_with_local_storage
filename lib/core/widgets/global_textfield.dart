import 'package:flutter/material.dart';

class TextFielCard {
  static CardTheme(
      {required hintTextName,
      required TextFielCardValidator,
      required TextFielCardController,
      required TextFielCardOnChanged,
      required TextFielCardKeyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: TextFormField(
            validator: TextFielCardValidator,
            controller: TextFielCardController,
            onChanged: TextFielCardOnChanged,
            keyboardType: TextFielCardKeyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTextName,
            ),
          ),
        ),
      ),
    );
  }
}
