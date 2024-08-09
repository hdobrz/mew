import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../components/category_icon.dart';
import '../components/custom_search_bar.dart';
import '../components/message_slider.dart';
import '../education/education_page.dart';
import '../help_center/help_center_page.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(),
            const SizedBox(height: 20.0),
            MessageSlider(),
            const SizedBox(height: 20.0),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                  image: AssetImage('assets/2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OpenContainer(
                  closedBuilder: (context, action) => CategoryIcon(
                    icon: Icons.school,
                    label: 'قسم التعليم',
                    onTap: action,
                  ),
                  openBuilder: (context, action) => EducationPage(),
                ),
                CategoryIcon(
                  icon: Icons.pets,
                  label: 'قسم التبني',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('الصفحة تحت الصيانة')),
                    );
                  },
                ),
                CategoryIcon(
                  icon: Icons.shopping_cart,
                  label: 'قسم المنتجات',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('الصفحة تحت الصيانة')),
                    );
                  },
                ),
                CategoryIcon(
                  icon: Icons.local_hospital,
                  label: 'قسم العيادات',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('الصفحة تحت الصيانة')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Card(
              child: ListTile(
                leading: const Icon(Icons.help, color: Colors.teal),
                title: const Text('مركز المساعدة'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpCenterPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
