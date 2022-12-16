import 'package:api_profile/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = 'https://reqres.in/api/users';
  Dio dio = Dio();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  Future<void> sendData(UserModel userModel) async {
    Response response = await dio.post(
      url,
      data: userModel.toJson(),
    );

    print('Response: ${response.data}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('API')),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Enter your name',
            ),
          ),
          TextFormField(
            controller: jobController,
            decoration: InputDecoration(
              hintText: 'Enter your job',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              sendData(UserModel(
                name: nameController.text,
                job: jobController.text,
              ));
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
