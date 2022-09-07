// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_testing_template/ui/pages/authentication/login.dart';
import 'package:f_testing_template/ui/pages/content/home.dart';
import 'package:f_testing_template/ui/text_form.dart';
import 'package:f_testing_template/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  const emailKey = Key("TextFormFieldLoginEmail");
  const loginKey = Key("LoginScreen");
  const passwordKey = Key("TextFormFieldLoginPassword");
  testWidgets(
      'Widget login validación @ email', (WidgetTester tester) async {});

  testWidgets('Widget login validación campo vacio email',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      email: "blank",
      password: "blank",
      key: loginKey,
    )));

    expect(find.byKey(loginKey), findsOneWidget);

    await tester.enterText(find.byKey(emailKey), "");

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(find.text("Enter email"), findsOneWidget);
  });

  testWidgets('Widget login validación número de caracteres password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      email: "blank",
      password: "blank",
      key: loginKey,
    )));

    expect(find.byKey(passwordKey), findsOneWidget);

    await tester.enterText(find.byKey(passwordKey), getRandomString(5));

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(find.text("Password should have at least 6 characters"),
        findsOneWidget);

    await tester.enterText(find.byKey(passwordKey), getRandomString(6));

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(
        find.text("Password should have at least 6 characters"), findsNothing);
  });

  testWidgets('Widget login validación campo vacio password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      email: "blank",
      password: "blank",
      key: loginKey,
    )));

    expect(find.byKey(passwordKey), findsOneWidget);

    await tester.enterText(find.byKey(passwordKey), "");

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(find.text("Enter password"), findsOneWidget);
  });

  testWidgets('Widget login autenticación exitosa',
      (WidgetTester tester) async {
    const pass = "123456";
    const email = "luis@gmail.com";

    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      email: email,
      password: pass,
      key: loginKey,
    )));

    expect(find.byKey(passwordKey), findsOneWidget);
    expect(find.byKey(emailKey), findsOneWidget);

    await tester.enterText(find.byKey(passwordKey), pass);
    await tester.enterText(find.byKey(emailKey), email);

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(find.byKey(loginKey), findsNothing);
  });

  testWidgets('Widget login autenticación no exitosa',
      (WidgetTester tester) async {
    const pass = "123456";
    const email = "luis@gmail.com";

    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      email: email,
      password: pass,
      key: loginKey,
    )));

    expect(find.byKey(passwordKey), findsOneWidget);
    expect(find.byKey(emailKey), findsOneWidget);

    await tester.enterText(find.byKey(passwordKey), "1234567");
    await tester.enterText(find.byKey(emailKey), "luis@gmail.com");

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(find.text("User or passwor nok"), findsOneWidget);
  });

  testWidgets('Widget signUp validación @ email', (WidgetTester tester) async {
    const pass = "123456";
    const email = "luis@gmail.com";

    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      email: email,
      password: pass,
      key: loginKey,
    )));

    expect(find.byKey(passwordKey), findsOneWidget);
    expect(find.byKey(emailKey), findsOneWidget);

    await tester.enterText(find.byKey(passwordKey), "1234567");
    await tester.enterText(find.byKey(emailKey), "luisgmail.com");

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(find.text("Validation nok"), findsOneWidget);
  });

  testWidgets('Widget signUp validación campo vacio email',
      (WidgetTester tester) async {
    const pass = "123456";
    const email = "luis@gmail.com";

    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      email: email,
      password: pass,
      key: loginKey,
    )));

    expect(find.byKey(passwordKey), findsOneWidget);
    expect(find.byKey(emailKey), findsOneWidget);

    await tester.enterText(find.byKey(passwordKey), "1234567");
    await tester.enterText(find.byKey(emailKey), "");

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(find.text("Validation nok"), findsOneWidget);
  });

  testWidgets('Widget signUp validación número de caracteres password',
      (WidgetTester tester) async {
    const pass = "1234";
    const email = "luis@gmail.com";

    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      email: email,
      password: pass,
      key: loginKey,
    )));

    expect(find.byKey(passwordKey), findsOneWidget);
    expect(find.byKey(emailKey), findsOneWidget);

    await tester.enterText(find.byKey(passwordKey), pass);
    await tester.enterText(find.byKey(emailKey), "luis@gmail.com");

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(find.text("Validation nok"), findsOneWidget);
  });

  testWidgets('Widget signUp validación campo vacio password',
      (WidgetTester tester) async {
    const pass = "1234";
    const email = "luis@gmail.com";

    await tester.pumpWidget(const GetMaterialApp(
        home: LoginScreen(
      email: email,
      password: pass,
      key: loginKey,
    )));

    expect(find.byKey(passwordKey), findsOneWidget);
    expect(find.byKey(emailKey), findsOneWidget);

    await tester.enterText(find.byKey(passwordKey), "");
    await tester.enterText(find.byKey(emailKey), "luis@gmail.com");

    await tester.tap(find.byType(OutlinedButton));

    await tester.pumpAndSettle();

    expect(find.text("Validation nok"), findsOneWidget);
  });

  testWidgets('Widget home visualización correo', (WidgetTester tester) async {
    const pass = "123456";
    const email = "luis@gmail.com";

    await tester.pumpWidget(const GetMaterialApp(
        home: HomePage(loggedEmail: email, loggedPassword: pass)));

    expect(find.text("Hello $email"), findsOneWidget);
  });

  testWidgets('Widget home nevegación detalle', (WidgetTester tester) async {
    const pass = "123456";
    const email = "luis@gmail.com";
    const homeKey = Key("home");
    await tester.pumpWidget(const GetMaterialApp(
        home:
            HomePage(key: homeKey, loggedEmail: email, loggedPassword: pass)));

    await tester.tap(find.byType(ElevatedButton));

    await tester.pumpAndSettle();

    expect(find.byKey(homeKey), findsNothing);
  });

  testWidgets('Widget home logout', (WidgetTester tester) async {
    const pass = "123456";
    const email = "luis@gmail.com";
    const homeKey = Key("home");
    await tester.pumpWidget(const GetMaterialApp(
        home:
            HomePage(key: homeKey, loggedEmail: email, loggedPassword: pass)));

    await tester.tap(find.byType(IconButton));

    await tester.pumpAndSettle();

    expect(find.byKey(homeKey), findsNothing);
  });
}
