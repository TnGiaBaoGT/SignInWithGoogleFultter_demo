import 'package:flutter/material.dart';
import 'package:google_signin_demo/auth/auth_service.dart';
import 'package:google_signin_demo/pages/login_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('SignIn with Google',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                ),
              ),
              Container(
                height: 50,
                width: size.width *0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple.withOpacity(0.3),
                ),
                child: IconButton(
                    onPressed: () async {
                      final user = await authService.signInWithGoogle();
                      print('${user?.displayName}');
                      await authService.signInWithGoogle();

                      //Nếu người dùng rời khỏi màn hình trong thời gian đó (async),
                      // context sẽ trở nên không hợp lệ.
                      if(!context.mounted) return;
                      //Khi gọi Navigator.push(context, ...),
                      // Flutter không tìm thấy context và báo lỗi.
                      Navigator.push(context, MaterialPageRoute(builder:
                      (context) => const LoginPage(),
                      ));
                    },
                    icon: const Icon(Icons.circle_notifications_rounded)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
