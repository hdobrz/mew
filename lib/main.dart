import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home_page.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Mew App',
            theme: themeProvider.getTheme(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
