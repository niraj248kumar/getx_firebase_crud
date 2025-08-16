import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ProductModel/UseModel.dart';

class DataBaseMethods extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxList<UserModels> userList = <UserModels>[].obs;

  void createData() async {
    if (nameController.text.isNotEmpty && addressController.text.isNotEmpty) {
   var docRef = await firebaseFirestore
          .collection("getUser")
          .add({
        "id": "",
        "name": nameController.text,
        "address": addressController.text
      });
      await docRef.update({"id": docRef.id});
      Get.back();
      fetchData();
      nameController.clear();
      addressController.clear();
    }else{
     Get.snackbar("Please fill in black", "message");
    }


  }

  void updateData(UserModels model) async {
    if (nameController.text.isNotEmpty && addressController.text.isNotEmpty) {
      firebaseFirestore
          .collection("getUser")
          .doc(model.id)
          .update(model.toJson());

      fetchData();
      Get.back();
      nameController.clear();
      addressController.clear();
    } else {
      Get.snackbar("Please fill in black", "message");
    }
  }

  Future<void> fetchData() async {
    firebaseFirestore.collection("getUser").snapshots().listen((event) {
      userList.assignAll(event.docs.map((e) {
        var data = e.data();
        return UserModels.fromJson(data);
      }).toList());
    });
  }

  Future<void> deleteUser(String userId) async {
    await firebaseFirestore.collection("getUser").doc(userId).delete();
    Get.snackbar("Delete", "Successful", backgroundColor: Colors.blue);
    fetchData();
  }
}
