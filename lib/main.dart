import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/RemoteService/data_provider.dart';


import 'package:shop/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shop/dependencies.dart' as dep;



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DataProvider()),
        ],
        child: const Shop(),
      ),

      );
}
