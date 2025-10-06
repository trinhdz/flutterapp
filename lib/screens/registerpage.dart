import 'package:cuoiki/screens/homepage.dart';
import 'package:cuoiki/screens/loginpage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double widthScale = screenWidth / 412;
    double heightScale = screenHeight / 917; 
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: widthScale * 85,
            top: heightScale * 202,
            child: const Text(
              "Creat Account",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
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


          Positioned(
            left: widthScale * 36,
            top: heightScale * 295,
            child: const Text(
              "Username",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            left: widthScale * 36,
            top: heightScale * 322,
            child: Container(
              width: screenWidth * 0.85,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF2F0F0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: Icon(Icons.person),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 13),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: widthScale * 36,
            top: heightScale * 402,
            child: const Text(
              "Email",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            left: widthScale * 36,
            top: heightScale * 430,
            child: Container(
              width: screenWidth * 0.85,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF2F0F0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 13),
                  ),
                ),
              ),
            ),
          ),


          Positioned(
            left: widthScale * 36,
            top: heightScale * 509,
            child: const Text(
              "Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            left: widthScale * 36,
            top: heightScale * 540,
            child: Container(
              width: screenWidth * 0.85,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF2F0F0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 13),
                  ),
                ),
              ),
            ),
          ),


          Positioned(
            left: widthScale * 58,
            top: heightScale * 619,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                width: screenWidth * 0.7,
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFA883FF),
                ),
                child: const Center(
                  child: Text(
                    "REGISTER",
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


          Positioned(
            left: widthScale * 113,
            top: heightScale * 817,
            child: Row(
              children: [
                const Text(
                  "Have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> LoginPage()),
                    );
                  },
                  child: Text(
                    "Login",
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