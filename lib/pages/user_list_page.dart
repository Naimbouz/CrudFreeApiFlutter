import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserListPage extends StatefulWidget {
  final ApiService apiService;

  UserListPage({required this.apiService});

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late List<User> userList = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      final data = await widget.apiService.getUsers();
      setState(() {
        userList = data;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: userList.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('ID: ${userList[index].id}'),
            subtitle: Text('Name: ${userList[index].name}'),
            // Add more fields as needed
          );
        },
      ),
    );
  }
}
