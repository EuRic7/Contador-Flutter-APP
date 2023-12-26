import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0, total = 0;
  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  Color redIntensity() {
    double intensity = count < 11 ? 12.5 * (count / 2) : 12.5 * count;
    intensity = 255 - intensity;
    return Color.fromRGBO(255, intensity.round(), intensity.round(), 1.0);
  }

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
      total++;
    });

    print(count);
  }

  void restart() {
    setState(() {
      count = 0;
      total = 0;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Flutter01.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Total: $total',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              isFull ? 'Lotado' : 'Pode Entrar',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? redIntensity() : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            GlowText(
              '$count',
              style: TextStyle(
                fontSize: 100,
                color: redIntensity(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty
                        ? Colors.yellow.withOpacity(0.2)
                        : Colors.yellow,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: GlowIcon(
                    Icons.keyboard_arrow_left,
                    glowColor: Colors.transparent,
                    size: 64,
                    blurRadius: 9,
                  ),
                ),
                const SizedBox(
                  width: 64,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.yellow.withOpacity(0.2) : Colors.yellow,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: GlowIcon(
                    Icons.keyboard_arrow_right,
                    glowColor: Colors.transparent,
                    size: 64,
                    blurRadius: 9,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: isEmpty && total == 0 ? null : restart,
              style: TextButton.styleFrom(
                backgroundColor: isEmpty && total == 0
                    ? Colors.red.withOpacity(0.2)
                    : Color.fromRGBO(255, 0, 0, 1.0),
                fixedSize: const Size(100, 45),
              ),
              child: Column(children: [
                Icon(
                  Icons.restart_alt,
                ),
                Text(
                  "Restart",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
