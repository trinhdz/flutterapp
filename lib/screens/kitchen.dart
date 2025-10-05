import 'package:flutter/material.dart';

class KitChen extends StatelessWidget {
  const KitChen({super.key});

  @override
  Widget build(BuildContext context) {
    bool switchValueLED1 = false;
    bool switchValueLED2 = false;
    bool switchValueFan = false;
    bool switchValueAir = false;
    return Scaffold(
      body: Stack(
        children: [
          // Nút Back 
          Positioned(
            left: 18,
            top: 23,
            child: SizedBox(
              width: 48,
              height: 48,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 28,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context); 
                },
              ),
            ),
          ),

          // KitChen 
          Positioned(
            top: 44,
            left: (MediaQuery.of(context).size.width - 243) / 2,
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
                "Kitchen",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Text Devices
          const Positioned(
            left: 37,
            top: 130,
            child: Text(
              "Devices",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          //LED 1
          Positioned(
            left: 25,
            top: 171,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  width: 167,
                  height: 183,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAF8D3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 39,
                        top: 12,
                        child: Container(
                          width: 92,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "LED 1",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // Hình ảnh đổi theo switch
                      Positioned(
                        left: 41,
                        top: 48,
                        child: SizedBox(
                          width: 88,
                          height: 88,
                          child: Image.asset(
                            switchValueLED1
                                ? 'assets/images/led.png'
                                : 'assets/images/led_off.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Switch
                      Positioned(
                        left: 53,
                        top: 144,
                        child: SizedBox(
                          width: 67,
                          height: 32,
                          child: Switch(
                            value: switchValueLED1,
                            onChanged: (val) {
                              setState(() {
                                switchValueLED1 = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Rectangle LED 2 (chưa thêm switch/ảnh)
          Positioned(
            left: 207,
            top: 171,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  width: 167,
                  height: 183,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFFBD),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 39,
                        top: 12,
                        child: Container(
                          width: 92,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "LED 2",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // Hình ảnh đổi theo switch
                      Positioned(
                        left: 41,
                        top: 48,
                        child: SizedBox(
                          width: 88,
                          height: 88,
                          child: Image.asset(
                            switchValueLED2
                                ? 'assets/images/led.png'
                                : 'assets/images/led_off.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Switch
                      Positioned(
                        left: 53,
                        top: 144,
                        child: SizedBox(
                          width: 67,
                          height: 32,
                          child: Switch(
                            value: switchValueLED2,
                            onChanged: (val) {
                              setState(() {
                                switchValueLED2 = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Positioned(
            left: 28,
            top: 370,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  width: 164,
                  height: 181,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC5FFDD),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 37,
                        top: 12,
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Fan",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // Hình ảnh đổi theo switch
                      Positioned(
                        left: 38,
                        top: 50,
                        child: SizedBox(
                          width: 88,
                          height: 88,
                          child: Image.asset(
                            switchValueFan
                                ? 'assets/images/fan.png'
                                : 'assets/images/fan_off.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Switch
                      Positioned(
                        left: 48,
                        top: 145,
                        child: SizedBox(
                          width: 67,
                          height: 32,
                          child: Switch(
                            value: switchValueFan,
                            onChanged: (val) {
                              setState(() {
                                switchValueFan = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Positioned(
            left: 207,
            top: 370,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  width: 164,
                  height: 181,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC2EEF7),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 37,
                        top: 12,
                        child: Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Fan",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // Hình ảnh đổi theo switch
                      Positioned(
                        left: 38,
                        top: 50,
                        child: SizedBox(
                          width: 88,
                          height: 88,
                          child: Image.asset(
                            switchValueAir
                                ? 'assets/images/air.png'
                                : 'assets/images/air_off.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Switch
                      Positioned(
                        left: 48,
                        top: 145,
                        child: SizedBox(
                          width: 67,
                          height: 32,
                          child: Switch(
                            value: switchValueAir,
                            onChanged: (val) {
                              setState(() {
                                switchValueAir = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Text Sensors
          const Positioned(
            left: 37,
            top: 580,
            child: Text(
              "Sensors",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Rectangle Temp
          Positioned(
            left: 32,
            top: 620,
            child: Container(
              width: 343,
              height: 101,
              decoration: BoxDecoration(
                color: const Color(0xFFFFB9B9),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: 40,
                    top: 28,
                    child: Text(
                      "Temp",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  
                  Positioned(
                    left: 120,
                    top: 28,
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Image.asset(
                        'assets/images/temp.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 180,
                    top: 12,
                    child: Container(
                      width: 149,
                      height: 76,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCFFCD),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "30 °C",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 32,
            top: 730,
            child: Container(
              width: 343,
              height: 101,
              decoration: BoxDecoration(
                color: const Color(0xFFA1BCFF),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: 40,
                    top: 28,
                    child: Text(
                      "Hum",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  
                  Positioned(
                    left: 120,
                    top: 28,
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Image.asset(
                        'assets/images/hum.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 180,
                    top: 12,
                    child: Container(
                      width: 149,
                      height: 76,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBFF1F3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "30 %",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
