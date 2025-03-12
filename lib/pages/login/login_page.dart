import 'package:flutter/material.dart';
import 'package:paw_and_craw/components/main_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(child: Text('Test'));
  }
}
