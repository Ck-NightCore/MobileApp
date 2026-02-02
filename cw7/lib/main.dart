import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDb();
  await DatabaseHelper.instance.initializeUsers();

  runApp(Myapp());
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Management',
      home: UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> _user = [];
  @override
  void initState();{
    super.initState();
    _fetchUsers();
    }

    Future<void>_fetchUsers() async{
      final userMaps = await DatabaseHelper.instance.queryAlluser();
      setState(() {
        _users = userMaps.map((userMaps) => User.fromMap(userMap: username, email: email))
      });
    }
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
