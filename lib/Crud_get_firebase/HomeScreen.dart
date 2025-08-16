import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_service/database_service.dart';
import 'Update_page.dart';
import 'add_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var getObject = Get.put(DataBaseMethods());

  @override
  void initState() {
    getObject.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(child: const Text('Crud With GetX')),
        ),
        body: Obx(
          () {
            if (getObject.userList.isNotEmpty) {
              return ListView.builder(
                itemCount: getObject.userList.length,
                itemBuilder: (context, index) {
                  var result = getObject.userList[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text("${result.name}"),
                      subtitle: Text("${result.address}"),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            // Press this button to edit a single product
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Get.to(UpdatePage(
                                  models: result,
                                ));
                              },
                              // _createOrUpdate(documentSnapshot)
                            ),
                            // This icon button is used to delete a single product
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                getObject.deleteUser(result.id!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Not Available Data in list"));
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.blue,
            onPressed: () {
              Get.to(AddDataScreen());
            },
            icon: Icon(Icons.add),
            label: Text("AddData")));
  }
}
