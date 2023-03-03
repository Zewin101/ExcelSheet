import 'package:excelsheet/model/userField_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class UserFormWidget extends StatefulWidget {
  final ValueChanged<User> onSavedUser;

  const UserFormWidget({Key? key, required this.onSavedUser}) : super(key: key);

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  late TextEditingController nameController;
  late TextEditingController costController;
  late TextEditingController dataController;
  var formKey = GlobalKey<FormState>();
  late bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUser();
  }

  void initUser() {
    nameController = TextEditingController();

    costController = TextEditingController();

    dataController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return "يرجى ادخال اسم العميل";
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text("اسم العميل"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: costController,
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return "يرجى ادخال المبلغ";
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text("المــبلغ"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: dataController,
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return "يرجى ادخال التاريخ";
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text("التاريخ"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       FlutterSwitch(
            //         inactiveText: '',
            //
            //         activeText: "",
            //         inactiveColor: Colors.cyan,
            //         width: 80,
            //         height: 25.0,
            //         valueFontSize: 0.0,
            //         toggleSize: 50.0,
            //         value: status,
            //         borderRadius: 20.0,
            //         padding: 1.0,
            //         showOnOff: true,
            //         onToggle: (val) {
            //           setState(() {
            //             status = val;
            //             print(status);
            //           });
            //         },
            //       ),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       status ? const Text("سـداد ",
            //       style: TextStyle(
            //         color: Colors.green,
            //         fontSize: 25,
            //         fontWeight: FontWeight.w900
            //       ),
            //       ) : const Text("ديـــن ",
            //         style: TextStyle(
            //           color: Colors.red,
            //             fontSize: 25,
            //             fontWeight: FontWeight.w900
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            ElevatedButton(
              onPressed: () async {
                vvv();
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
    );
  }

  void vvv() {
    if (formKey.currentState!.validate()) {
      final user = User(
          name:  nameController.text,
         cost:  costController.text,
         data:  dataController.text);
      widget.onSavedUser(user);
    }
  }
}
