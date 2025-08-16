import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Crud_get_firebase/HomeScreen.dart';
import '../api_service/apiService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var getController = Get.put(UserApiService());

  @override
  void initState() {
    super.initState();
    getController.fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("GetX Api Call")),backgroundColor: Colors.blue,
        actions: [
        InkWell(onTap: () {
          Get.to(HomeScreen());
        },child: Icon(Icons.navigate_next_rounded),),
          SizedBox(width: 20,)
      ],),
      body: Obx(() => ListView.builder(
            itemCount: getController.productsList.length,
            itemBuilder: (context, index) {
              if(getController.productsList.isNotEmpty) {
                var data = getController.productsList[index];
                return ListTile(title: Column(
                  children: [
                    Text("${data.title}"),
                     ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(data.image.toString(),
                        width: 200,
                        height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Text('Image Load Failed'));
                        },
                      ),
                    ),
                  ],
                ),);
              }
              return null;

          },)),
    );
  }
}
