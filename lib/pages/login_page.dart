import 'package:flutter/material.dart';
import 'package:google_signin_demo/auth/auth_service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('LogIn Page'),
        actions: [
          IconButton(
              onPressed: () async{
                await authService.SignOut();
                
                if(!context.mounted) return;
                Navigator.pop(context);
                print('LogOut successful.');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(

      ),
    );
  }
}
