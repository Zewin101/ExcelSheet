import 'package:excelsheet/model/userField_model.dart';
import 'package:excelsheet/shard/remot/sheetApi.dart';
import 'package:flutter/material.dart';

import 'homeScreen/home_screen.dart';

class ScreenSheet extends StatefulWidget {
  const ScreenSheet({Key? key}) : super(key: key);
  static const String routeName = "sheetScreen";

  @override
  State<ScreenSheet> createState() => _ScreenSheetState();
}

class _ScreenSheetState extends State<ScreenSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.green,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            )),
        title: Text("Excel Sheet"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserFormWidget(),
              ElevatedButton(
                onPressed: () async{
                  insertUser();
                  setState(() {

                  });
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future insertUser()async{
    final users=[
      User(2, "name", "cost", "data"),
      User(3, "name", "cost", "data"),
      User(4, "name", "cost", "data"),
      User(5, "name", "cost", "data"),
      User(7, "name", "cost", "data"),
      User(8, "name", "cost", "data"),
      User(9, "name", "cost", "data"),
    ];
    final jsonUsers=users.map((user) => user.toJson()).toList();
    await UserSheetsApi.insert(jsonUsers);
  }
}
