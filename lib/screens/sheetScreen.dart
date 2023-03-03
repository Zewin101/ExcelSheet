import 'package:excelsheet/model/userField_model.dart';
import 'package:excelsheet/shard/remot/sheetApi.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';
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
    return Stack(
      children: [

        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.green,
            shape: const OutlineInputBorder(
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
                  UserFormWidget(
                    onSavedUser: (user) async{
                    final id=await UserSheetsApi.getRowCount()+1;
                    print(id);
                    final newUser=user.copy(id:id);
                    await UserSheetsApi.insert([newUser.toJson()]);

                    print(user.toJson());

                  },),
                  ElevatedButton(
                    onPressed: () async{

                      setState(() {

                      });
                    },
                    style: ElevatedButton.styleFrom(),
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
