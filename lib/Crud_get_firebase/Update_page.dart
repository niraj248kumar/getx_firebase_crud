import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_api_call/ProductModel/UseModel.dart';

import '../api_service/database_service.dart';

class UpdatePage extends StatefulWidget {
final UserModels models;
  const UpdatePage({super.key, required this.models});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var getObject = Get.put(DataBaseMethods());
@override
  void initState() {
    super.initState();
    getObject.nameController.text = widget.models.name!;
    getObject.addressController.text = widget.models.address!;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Update Data With GetX')),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: getObject.nameController,
              decoration: const InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(),hintText: "Name.."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: getObject.addressController,
              decoration: const InputDecoration(
                label: Text("Address"),
                border: OutlineInputBorder(),hintText: "Address.."
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 20),),
                  onPressed: () {
                  var update = UserModels(
                    id: widget.models.id,
                    name: getObject.nameController.text,
                    address: getObject.addressController.text
                  );
                    getObject.updateData(update);
                  },

              ),
            ),
          )
        ],
      ),
    );
  }
}
