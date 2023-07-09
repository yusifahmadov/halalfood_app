import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_button.dart';
import 'package:halalfood/features/main/presentation/widgets/custom_text_field.dart';
import 'package:halalfood/features/product/presentation/pages/product_page_view.dart';

import 'package:halalfood/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  group('test signUp', () {
    testWidgets(
        'should return success flasher and should navigate to [SignUpDetailPageView]',
        (tester) async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key("emailField")),
          'test323212@gmail.com'); // if you get success, make sure that you use unique email
      await tester.enterText(find.byKey(const Key("passwordField")), 'test123');
      await tester.enterText(
          find.byKey(const Key("passwordAgainField")), 'test123');
      await tester.enterText(find.byKey(const Key("nameField")), 'test');
      await tester.enterText(find.byKey(const Key("surnameField")), 'test');
      await tester.enterText(
          find.byKey(const Key("phoneNumberField")), '50-763-33-61');
      await tester.enterText(find.byKey(const Key("ageField")), '29.10.2003');
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("successFlash")), findsOneWidget);
      expect(find.byType(ProductPageView), findsOneWidget);
    });
    testWidgets(
        'should return error flasher and should not navigate to [SignUpDetailPageView]',
        (tester) async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key("emailField")),
          'test3@gmail.com'); // if you get fail, make sure that you don't use unique email

      await tester.enterText(find.byKey(const Key("passwordField")), 'test123');
      await tester.enterText(
          find.byKey(const Key("passwordAgainField")), 'test123');
      await tester.enterText(find.byKey(const Key("nameField")), 'test');
      await tester.enterText(find.byKey(const Key("surnameField")), 'test');
      await tester.enterText(
          find.byKey(const Key("phoneNumberField")), '50-763-33-61');
      await tester.enterText(find.byKey(const Key("ageField")), '29.10.2003');
      await tester.tap(find.byType(CustomTextButton));

      await tester.pumpAndSettle();
      expect(find.byKey(const Key("failFlash")), findsOneWidget);
      expect(find.byType(ProductPageView), findsNothing);
    });

    testWidgets('test all required fields', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();
      expect(find.text('Boş buraxıla bilməz!'), findsNWidgets(7));
    });

    testWidgets('test text field suffix icon for date of birth',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SvgPicture).at(0));
      await tester.pumpAndSettle();
      expect(find.byType(DatePickerDialog), findsOneWidget);
    });

    testWidgets(
        'test text field suffix icon and set data to controller for date of birth',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SvgPicture).at(0));
      await tester.pumpAndSettle();
      expect(find.byType(DatePickerDialog), findsOneWidget);
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key("ageField")), "29.10.2003");
      await tester.pumpAndSettle();
      expect(
          (tester.widget(find.byKey(const Key("ageField"))) as CustomTextField)
              .controller!
              .text,
          "29.10.2003");
    });
    testWidgets('test email field should return error if typed wrong format',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key("emailField")), "test");
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();
      expect(find.text("Düzgün email daxil edilməyib!"), findsOneWidget);
    });
    testWidgets(
        'test phone number field should return error if typed wrong format',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(const Key("phoneNumberField")), "50-763-33");
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();
      expect(find.text("Nömrə tam daxil edilməyib!"), findsOneWidget);
    });
    testWidgets('test age field should return error if typed wrong format',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key("ageField")), "10");
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextButton));
      await tester.pumpAndSettle();
      expect(find.text("Doğum tarixi tam daxil edilməyib!"), findsOneWidget);
    });
  });
}
