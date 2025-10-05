
import 'package:cuoiki/screens/bedroom.dart';
import 'package:cuoiki/screens/kitchen.dart';
import 'package:cuoiki/screens/livingroom.dart';
import 'package:cuoiki/screens/loginpage.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor:Color(0xFFC3D2FF),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            iconSize: 36,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text("Home Page",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed:() {
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(builder: (context)=> LoginPage()), 
                (route) => false);
            }, 
            icon: Icon(Icons.logout_rounded, size: 36),
          )
        ],
      ),
      body: Stack(
        children:[
          Positioned(
            left:86,
            top: 30,
            child: Image.asset('assets/decorate/Rectangle.png',
              width: 240,
              height: 138
              ),
          ),
          Positioned(
            left:86,
            top: 200,
            child: Image.asset('assets/decorate/Rectangle1.png',
              width: 240,
              height: 138
              ),
          ),
          Positioned(
            left:86,
            top: 380,
            child: Image.asset('assets/decorate/Rectangle2.png',
              width: 240,
              height: 138
              ),
          ),
          Positioned(
            left:86,
            top: 560,
            child: Image.asset('assets/decorate/Rectangle3.png',
              width: 240,
              height: 138
              ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFCFE4FF),
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text("HOME", style: TextStyle(color: Colors.black, fontSize: 45,fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              leading: const Icon(Icons.home, size: 45,),
              title: const Text("Home",style: TextStyle(fontSize: 25,color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              leading: const Icon(Icons.living, size: 45,),
              title: const Text("LivingRoom",style: TextStyle(fontSize: 25,color: Colors.black),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LivingRoom()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              leading: const Icon(Icons.bed,size: 45,),
              title: const Text("Bedroom",style: TextStyle(fontSize: 25,color: Colors.black),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bedroom()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              leading: const Icon(Icons.kitchen, size: 45,),
              title: const Text("Kitchen",style: TextStyle(fontSize: 25,color:Colors.black),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KitChen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}