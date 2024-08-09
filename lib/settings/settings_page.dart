import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('لون الشريط السفلي'),
              trailing: DropdownButton<Color>(
                value:
                    Provider.of<ThemeProvider>(context).getBottomNavBarColor(),
                onChanged: (Color? newColor) {
                  if (newColor != null) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setBottomNavBarColor(newColor);
                  }
                },
                items: <Color>[Colors.teal, Colors.blue, Colors.green]
                    .map<DropdownMenuItem<Color>>((Color value) {
                  return DropdownMenuItem<Color>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ),
            ListTile(
              title: const Text('شكل الشريط السفلي'),
              trailing: DropdownButton<BottomNavigationBarType>(
                value:
                    Provider.of<ThemeProvider>(context).getBottomNavBarType(),
                onChanged: (BottomNavigationBarType? newType) {
                  if (newType != null) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setBottomNavBarType(newType);
                  }
                },
                items: <BottomNavigationBarType>[
                  BottomNavigationBarType.fixed,
                  BottomNavigationBarType.shifting
                ].map<DropdownMenuItem<BottomNavigationBarType>>(
                    (BottomNavigationBarType value) {
                  return DropdownMenuItem<BottomNavigationBarType>(
                    value: value,
                    child: Text(value.toString().split('.').last),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
