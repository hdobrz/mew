import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mew/main.dart';  // تأكد من استيراد المسار الصحيح

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // بناء واجهة التطبيق واختباره
    await tester.pumpWidget(MyApp());

    // التحقق من وجود النص "0"
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // الضغط على زر "+" والتحقق من زيادة العداد
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // التحقق من وجود النص "1"
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
