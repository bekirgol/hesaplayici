import 'package:flutter/material.dart';
import 'package:harfnotuhesaplama/pages/auth.dart';
import 'package:harfnotuhesaplama/pages/harf_notu_hesaplama.dart';
import 'package:harfnotuhesaplama/pages/signup.dart';
import 'package:harfnotuhesaplama/pages/vize_final_hesaplama.dart';
import 'package:harfnotuhesaplama/pages/start.dart';
import 'pages/donem_ortalamasi_hesaplama.dart';
import 'pages/t_score_hesaplama.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPages(),
      routes: {
        '/login': (BuildContext context) => StartPages(),
        '/vize-final': (BuildContext context) => VizeFinalCalculation(),
        '/t-score': (BuildContext context) => TScoreCalculation(),
        '/harfNotu': (BuildContext context) => HarfNotuCalculation(),
        '/donem': (BuildContext context) => DonemOrtalamasiCalculation(),
        '/logout': (BuildContext context) => AuthPages(),
        '/signup': (BuildContext context) => SignUp(),
      },
    );
  }
}
