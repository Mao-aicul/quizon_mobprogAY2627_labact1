import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizon_mobprog/widgets/newsfeed_card.dart';

void main() {
  testWidgets('each Like press increments the displayed count', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (_, child) => const MaterialApp(
          home: Scaffold(
            body: NewsFeedCard(
              userName: 'Test User',
              postContent: 'Test post',
              date: 'Today',
              numOfLikes: 255,
            ),
          ),
        ),
      ),
    );

    expect(find.text('255'), findsOneWidget);

    await tester.tap(find.text('Like'));
    await tester.pump();
    expect(find.text('256'), findsOneWidget);

    await tester.tap(find.text('Like'));
    await tester.pump();
    expect(find.text('257'), findsOneWidget);
  });
}
