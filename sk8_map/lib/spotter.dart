import 'package:flutter/material.dart';
import 'main.dart';

class SpotterScreen extends StatelessWidget {
  const SpotterScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  final bool isDarkMode;
  final Function(bool) toggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: Stack(
        children: [
          const Center(
            child: Text('Spotter Screen'),
          ),
          Positioned(
            top: 24.0,
            left: 16.0,
            child: Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(isDarkMode ?  0xFF333333 : 0xFF0066FF),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
