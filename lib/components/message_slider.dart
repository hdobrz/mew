import 'package:flutter/material.dart';

class MessageSlider extends StatefulWidget {
  @override
  _MessageSliderState createState() => _MessageSliderState();
}

class _MessageSliderState extends State<MessageSlider> {
  final List<String> messages = [
    'تذكر أهمية التلقيح لقطتك',
    'التأكد من إعطاء حبوب الديدان بانتظام',
    'التغذية السليمة تجعل قطتك صحية وسعيدة',
    'توفير الماء النظيف والعذب بشكل دائم',
    'الاهتمام بنظافة صندوق الرمل يوميًا',
    'زيارة الطبيب البيطري بانتظام للفحص',
    'اللعب مع قطتك يساعد في تحسين مزاجها',
    'تجنب تقديم الأطعمة الضارة للقطط مثل الشوكولاتة',
    'توفير بيئة آمنة ومريحة لقطتك',
    'العناية بنظافة فراء قطتك بانتظام'
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % messages.length;
        });
        _startAutoSlide();
      }
    });
  }

  double _calculateFontSize(String message) {
    int length = message.split(' ').length;
    if (length <= 3) {
      return 22.0;
    } else if (length <= 6) {
      return 18.0;
    } else {
      return 14.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 100, // زيادة الارتفاع
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.teal.shade700, Colors.teal.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.info, color: Colors.white, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                messages[_currentIndex],
                style: TextStyle(
                    fontSize: _calculateFontSize(messages[_currentIndex]),
                    color: Colors.white), // ضبط حجم النص
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
