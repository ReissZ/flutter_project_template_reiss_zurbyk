// lib/color_changing_page.dart
import 'package:flutter/material.dart';
import 'color_changing_service.dart';


class ColorChangingPage extends StatefulWidget {
  const ColorChangingPage({super.key});

  @override
  State<ColorChangingPage> createState() => _ColorChangingPageState();
}

class _ColorChangingPageState extends State<ColorChangingPage> {
  final ColorChangingService _colorService = ColorChangingService();
  Color _backgroundColor = Colors.white;

  //Randomize bg color
  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = _colorService.generateRandomColor();
    });
  }

  // Bg color reset to white
  void _resetBackgroundColor() {
    setState(() {
      _backgroundColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = _backgroundColor.computeLuminance();
    final textColor = brightness > 0.5 ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _changeBackgroundColor,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Text(
                'Hello there',
                style: TextStyle(
                  fontSize: 32,
                  color: textColor,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: _resetBackgroundColor,
                  child: const Text('Reset Color'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}