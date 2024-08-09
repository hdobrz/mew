import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterPage extends StatelessWidget {
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,  // جعل "Contact Us" هي الواجهة الأولى
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مركز المساعدة'),
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'قسم الأسئلة الشائعة'),
              Tab(text: 'اتصل بنا'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            // قسم الأسئلة الشائعة
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const ListTile(
                    title: Text('ما هي الأطعمة التي يجب تجنبها؟'),
                    subtitle: Text(
                        'تجنب تقديم الأطعمة الضارة للقطط مثل الشوكولاتة، البصل، والثوم.'),
                  ),
                  const ListTile(
                    title: Text('ما هي أهمية التلقيح؟'),
                    subtitle: Text(
                        'التلقيح يحمي قطتك من الأمراض الشائعة والخطيرة.'),
                  ),
                  const ListTile(
                    title: Text('كيف يمكنني العناية بفراء قطتي؟'),
                    subtitle: Text(
                        'قم بتمشيط فراء قطتك بانتظام وتجنب التشابك والتراكمات.'),
                  ),
                ],
              ),
            ),
            // قسم اتصل بنا
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.teal),
                    title: const Text('WhatsApp'),
                    onTap: () => _launchURL('https://wa.me/9647733344445'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.teal),
                    title: const Text('Website'),
                    subtitle: const Text('mew-iq.com'),
                    onTap: () => _launchURL('https://mew-iq.com'),
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.facebook, color: Colors.teal),
                    title: const Text('Facebook'),
                    onTap: () => _launchURL('https://www.facebook.com/cattery.haider'),
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.instagram, color: Colors.teal),
                    title: const Text('Instagram'),
                    onTap: () => _launchURL('https://www.instagram.com/cattery_haider/'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
