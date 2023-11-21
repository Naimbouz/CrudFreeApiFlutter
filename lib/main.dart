import 'package:flutter/material.dart';
import 'package:tp7/pages/user_list_page.dart';
import 'package:tp7/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService(baseUrl: 'http://localhost:3000');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Example',
      home: UserListPage(apiService: apiService),
    );
  }
}
