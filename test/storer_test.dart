import 'package:flutter_test/flutter_test.dart';
import 'package:gbefun/main.dart';
import 'package:flutter/material.dart';

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() async {
  testWidgets('AddUser Widget contains add user button',
      (WidgetTester tester) async {
    final firestore = FakeFirebaseFirestore();

    await tester.pumpWidget(MyApp(firestore: firestore));

    expect(find.byKey(const Key('add user button')), findsOneWidget);
  });
}
