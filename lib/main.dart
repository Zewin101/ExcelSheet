
import 'package:excelsheet/screens/homeScreen/home_screen.dart';
import 'package:excelsheet/shard/remot/sheetApi.dart';
import 'package:excelsheet/screens/sheetScreen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
     initialRoute:ScreenSheet.routeName ,
      routes: {
        ScreenSheet.routeName:(context) => ScreenSheet(),

      },
    );
  }
}

