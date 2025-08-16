import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../api_service/database_service.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  var getObject = Get.put(DataBaseMethods());
  @override
  void initState() {
    getObject.fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Add Data With GetX')),backgroundColor: Colors.blue,),
      body:
      Column(
       mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: getObject.nameController,
              decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Name.."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: getObject.addressController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),hintText: "Address..."
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
                child: Text('create',style: TextStyle(color: Colors.white,fontSize: 20),),
                onPressed: () {
                  getObject.createData();

                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
