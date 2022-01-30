import 'package:flutter/material.dart';
import 'package:cards/cards_home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/cards",
    routes: {
      "/cards": (context) => CardsHome(),
    },
  ));
}
