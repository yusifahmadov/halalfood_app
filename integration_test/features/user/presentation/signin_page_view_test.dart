import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_button.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_text_field.dart';
import 'package:halalfood/features/product/presentation/pages/product_page_view.dart';

import 'package:halalfood/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  testWidgets(
      'should return success flasher and should navigate to [ProductsPage]',
      (tester) async {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Giriş et'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(CustomTextField).at(0),
        'test1@gmail.com'); // if you get success, make sure that you use email is already registered
    await tester.enterText(find.byType(CustomTextField).at(1), 'test123');

    await tester.tap(find.byType(CustomTextButton));
    await tester.pumpAndSettle();

    expect(find.byType(ProductPageView), findsOneWidget);
    expect(find.byKey(const Key("successFlash")), findsOneWidget);
  });
  testWidgets(
      'should return error flasher and should not navigate to [ProductsPage]',
      (tester) async {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Giriş et'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(CustomTextField).at(0),
        'test123123@gmail.com'); // if you get success, make sure that you use email is already registered
    await tester.enterText(find.byType(CustomTextField).at(1), 'test123');

    await tester.tap(find.byType(CustomTextButton));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key("failFlash")), findsOneWidget);
    expect(find.byType(ProductPageView), findsNothing);
  });
  testWidgets('test email field should return error if typed wrong format',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Giriş et'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(CustomTextField).at(0), 'test123123');
    await tester.pumpAndSettle();
    await tester.tap(find.byType(CustomTextButton));
    await tester.pumpAndSettle();
    expect(find.text("Düzgün email daxil edilməyib!"), findsOneWidget);
  });
  testWidgets('test all required fields', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Giriş et'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(CustomTextButton));
    await tester.pumpAndSettle();
    expect(find.text('Boş buraxıla bilməz!'), findsNWidgets(2));
  });
}
