import 'package:cuoiki/screens/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:cuoiki/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString('email');
    final savePassword = prefs.getString('password');

    final inputEmail = emailController.text.trim();
    final inputPassword = passwordController.text.trim();

    if(inputEmail.isEmpty || inputPassword.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('vui long dien du thong tin'),)
      );
      return;
    }

    if(inputEmail == savedEmail && inputPassword == savePassword){

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('dang nhap thanh cong'),)
      );

      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sai email or password'),)
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Chữ Welcome
          Positioned(
            left: screenWidth * 0.33,
            top: screenHeight * 0.15,
            child: const Text(
              "Welcome",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Các hình tròn trang trí
          Positioned(
            left: screenWidth * 0.12,
            top: screenHeight * 0.05,
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xFFFFDCDC),
            ),
          ),
          Positioned(
            left: screenWidth * 0.72,
            top: screenHeight * 0.12,
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xFFC3D2FF),
            ),
          ),
          Positioned(
            left: screenWidth * 0.1,
            top: screenHeight * 0.18,
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xFFFFB5E6),
            ),
          ),
          Positioned(
            left: screenWidth * 0.78,
            top: screenHeight * 0.9,
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xFFFFDCDC),
            ),
          ),
          Positioned(
            left: screenWidth * 0.2,
            top: screenHeight * 0.95,
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xFFA1FFC8),
            ),
          ),

          // Hình ảnh nền
          Positioned(
            left: screenWidth * 0.15,
            top: screenHeight * 0.22,
            child: Image.asset(
              'assets/decorate/backgr.png',
              width: screenWidth * 0.75,
              height: screenWidth * 0.75,
            ),
          ),

          // Ô nhập Email
          Positioned(
            left: screenWidth * 0.1,
            top: screenHeight * 0.56,
            child: Container(
              width: screenWidth * 0.85,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF2F0F0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 13),
                  ),
                ),
              ),
            ),
          ),

          // Ô nhập Password
          Positioned(
            left: screenWidth * 0.1,
            top: screenHeight * 0.63,
            child: Container(
              width: screenWidth * 0.85,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF2F0F0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 13),
                  ),
                ),
              ),
            ),
          ),

          // Nút LOGIN
          Positioned(
            left: screenWidth * 0.17,
            top: screenHeight * 0.72,
            child: GestureDetector(
              onTap: login,
              child: Container(
                width: screenWidth * 0.7,
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFA883FF),
                ),
                child: const Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Chữ OR
          Positioned(
            left: screenWidth * 0.48,
            top: screenHeight * 0.8,
            child: const Text(
              "OR",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.24,
            top: screenHeight * 0.83,
            child: Row(
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> RegisterPage()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}