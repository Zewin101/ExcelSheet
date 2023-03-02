import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class UserFormWidget extends StatefulWidget {
  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  var nameController = TextEditingController();

  var costController = TextEditingController();

  var dataController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
      Row(
        children: [
        FlutterSwitch(
        width: 160.0,
        height: 50.0,
        valueFontSize: 20.0,
        toggleSize: 30.0,
        value: status,
          activeText: 'ســداد',
        inactiveText: 'ديــن',
        inactiveToggleColor: Colors.red,
        borderRadius: 30.0,
        padding: 5.0,
        showOnOff: status,
        onToggle: (val) {
          setState(() {
            status = !status;
          });
        },
      ),
      SizedBox(
        width: 15,
      ),
      status ?
      Text("سداد ") : Text("دين "),
      ],
    ),
    const SizedBox(
    height: 15,
    ),
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
    ]
    ,
    )
    ,
    );
  }

  void vvv() {
    if (formKey.currentState!.validate()) {}
  }
}
