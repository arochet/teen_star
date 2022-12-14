import 'package:teenstar/APPLICATION/auth/auth_notifier.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    if (authState is AuthAuthenticated) {
      Future.delayed(Duration.zero, () async {
        ref.read(currentPageNavProvider.notifier).state = 0;
        context.router.replaceAll([MainNavigationRoute()]);
      });
    } else if (authState is AuthUnauthenticated) {
      Future.delayed(Duration.zero, () async {
        context.router.replaceAll([AuthInitRoute()]);
      });
    }
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
