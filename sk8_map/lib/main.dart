import 'package:flutter/material.dart';
import 'spotter.dart';
import 'feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _isDarkMode = isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: SpotterScreen(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = (context.findAncestorStateOfType<_MyAppState>()?._isDarkMode) ?? false;
    final toggleTheme = (context.findAncestorStateOfType<_MyAppState>()?._toggleTheme) ?? (bool value) {};

    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Sk8 Map'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Spotter'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpotterScreen(
                    isDarkMode: isDarkMode,
                    toggleTheme: toggleTheme,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Feed'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeedScreen(
                    isDarkMode: isDarkMode,
                    toggleTheme: toggleTheme,
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SwitchListTile(
              secondary: const Icon(Icons.wb_sunny),
              title: Text(isDarkMode ? 'Light Mode' : 'Dark Mode'),
              value: isDarkMode,
              onChanged: toggleTheme,
            ),
          ),
        ],
      ),
    );
  }
}
