import 'package:teenstar/PRESENTATION/reglages/account/account_page.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_page.dart';
import 'package:teenstar/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';

import 'app_test.dart';

void main() {
  testWidgets(
    "Test Account - La page info affiche bien les données correctements",
    (WidgetTester tester) async {
      await Firebase.initializeApp();
      await tester.pumpWidget(
        buildMainWidgetWithOption(
          AccountPage(),
          [
            currentUserData.overrideWithProvider(currentUserDataOverride),
            environment.overrideWith((_) => Environment(Environment.test))
          ],
        ),
      );

      await tester.pump();

      expect(find.text("MyUserName"), findsOneWidget);
      expect(find.text("azer@yopmail.com"), findsOneWidget);
    },
  );

  testWidgets(
    "Test Account - La page Modification de profil affiche les données utilisateurs",
    (WidgetTester tester) async {
      await tester.pumpWidget(buildMainWidgetWithOption(
        ModifyAccountPage(),
        [currentUserData.overrideWithProvider(currentUserDataOverride)],
      ));
      await tester.pumpAndSettle();
      expect(find.text("Modifier Profil"), findsOneWidget);
    },
  );
}
