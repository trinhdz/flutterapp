import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Bedroom extends StatefulWidget {
  const Bedroom({super.key});

  @override
  State<Bedroom> createState() => _BedroomState();
}

class _BedroomState extends State<Bedroom> {
  late DatabaseReference dbRef;

  // Biến trạng thái
  bool led1 = false;
  bool led2 = false;
  bool fan = false;
  bool air = false;
  int temp = 0;
  int hum = 0;

  @override
  void initState() {
    super.initState();

    dbRef = FirebaseDatabase.instance.ref("bedroom");
    // Lắng nghe dữ liệu Firebase Realtime Database
    dbRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        setState(() {
          led1 = data['led1'] as bool? ?? false;
          led2 = data['led2'] as bool? ?? false;
          fan = data['fan'] as bool? ?? false;
          air = data['air'] as bool? ?? false;
          temp = (data['temp'] as num?)?.toInt() ?? 0;
          hum = (data['hum'] as num?)?.toInt() ?? 0;
        });
      }
    });
  }

  // Hàm cập nhật bool lên Firebase
  void updateBool(String key, bool value) {
    dbRef.child(key).set(value);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double widthScale = screenWidth / 412;
    double heightScale = screenHeight / 917;

    return Scaffold(
      body: Stack(
        children: [
          // Nút Back
          Positioned(
            left: widthScale * 18,
            top: heightScale * 23,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Tiêu đề Bedroom
          Positioned(
            top: heightScale * 44,
            left: (screenWidth - 243) / 2,
            child: Container(
              width: 243,
              height: 41,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Bedroom",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Label "Devices"
          Positioned(
            left: widthScale * 37,
            top: heightScale * 130,
            child: const Text(
              "Devices",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),

          // Widget LED1
          Positioned(
            left: widthScale * 25,
            top: heightScale * 171,
            child: buildDeviceCard(
              title: "LED 1",
              imageOn: "assets/images/led.png",
              imageOff: "assets/images/led_off.png",
              value: led1,
              color: const Color(0xFFFAF8D3),
              onChanged: (val) {
                setState(() => led1 = val);
                updateBool("led1", val);
              },
            ),
          ),

          // Widget LED2
          Positioned(
            left: widthScale * 207,
            top: heightScale * 171,
            child: buildDeviceCard(
              title: "LED 2",
              imageOn: "assets/images/led.png",
              imageOff: "assets/images/led_off.png",
              value: led2,
              color: const Color(0xFFDCFFBD),
              onChanged: (val) {
                setState(() => led2 = val);
                updateBool("led2", val);
              },
            ),
          ),

          // Widget Fan
          Positioned(
            left: widthScale * 28,
            top: heightScale * 390,
            child: buildDeviceCard(
              title: "Fan",
              imageOn: "assets/images/fan.png",
              imageOff: "assets/images/fan_off.png",
              value: fan,
              color: const Color(0xFFC5FFDD),
              onChanged: (val) {
                setState(() => fan = val);
                updateBool("fan", val);
              },
            ),
          ),

          // Widget Air
          Positioned(
            left: widthScale * 207,
            top: heightScale * 390,
            child: buildDeviceCard(
              title: "Air",
              imageOn: "assets/images/air.png",
              imageOff: "assets/images/air_off.png",
              value: air,
              color: const Color(0xFFC2EEF7),
              onChanged: (val) {
                setState(() => air = val);
                updateBool("air", val);
              },
            ),
          ),

          // Label "Sensors"
          Positioned(
            left: widthScale * 37,
            top: heightScale * 600,
            child: const Text(
              "Sensors",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),

          // Sensor Temp
          Positioned(
            left: widthScale * 32,
            top: heightScale * 640,
            child: buildSensorCard(
              title: "Temp",
              value: "$temp °C",
              imagePath: "assets/images/temp.png",
              color: const Color(0xFFFFB9B9),
            ),
          ),

          // Sensor Hum
          Positioned(
            left: widthScale * 32,
            top: heightScale * 760,
            child: buildSensorCard(
              title: "Hum",
              value: "$hum %",
              imagePath: "assets/images/hum.png",
              color: const Color(0xFFA1BCFF),
            ),
          ),
        ],
      ),
    );
  }

  // Widget thiết bị
  Widget buildDeviceCard({
    required String title,
    required String imageOn,
    required String imageOff,
    required bool value,
    required Color color,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      width: 167,
      height: 183,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 92,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            value ? imageOn : imageOff,
            width: 88,
            height: 88,
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  // Widget sensor
  Widget buildSensorCard({
    required String title,
    required String value,
    required String imagePath,
    required Color color,
  }) {
    return Container(
      width: 343,
      height: 101,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        children: [
          const SizedBox(width: 30),
          Text(
            title,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(width: 20),
          Image.asset(imagePath, width: 45, height: 45),
          const Spacer(),
          Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFFCFFCD),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2),
            ),
            alignment: Alignment.center,
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
