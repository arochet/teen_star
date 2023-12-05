import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import 'main_home_title.dart';

class MainScaffold extends ConsumerStatefulWidget {
  final Widget child;
  final String? title;
  const MainScaffold({Key? key, required this.child, this.title});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final notifier = ref.read(showFilePath.notifier);
      notifier.state = !ref.read(showFilePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('overrinde ${ref.watch(languageApp).value?.code}');
    return LayoutBuilder(builder: (context, constraints) {
      if (kIsWeb && constraints.maxWidth > 600)
        return Scaffold(
          body: Row(
            children: [
              Container(
                  width: 300,
                  child: Column(
                    children: [
                      MainHomeTitle(),
                      NavLinkRetour(),
                    ],
                  )),
              Expanded(child: widget.child),
            ],
          ),
        );
      else
        return Scaffold(
          appBar: _buildAppBar(context, ref, widget.title),
          body: widget.child,
        );
    });
  }

  AppBar? _buildAppBar(BuildContext context, WidgetRef ref, String? title) {
    final env = ref.watch(environment.notifier).state.name;
    final dataAsync = ref.read(currentUserData.future);
    return AppBar(
      toolbarHeight: 55,
      backgroundColor: ref.watch(themeApp).value?.color, //colorpanel(900),
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: actioncolor['primary'],
        size: 24,
      ),
      title: title != null
          ? Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: actioncolor['primary']),
              overflow: TextOverflow.fade,
            )
          : null,
      actions: env == Environment.dev
          ? [
              InkWell(
                onTap: () {
                  final notifier = ref.read(showFilePath.notifier);
                  notifier.state = !ref.read(showFilePath);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.remove_red_eye, size: 25),
                ),
              ),
            ]
          : null,
    );
  }
}

class NavLinkRetour extends StatelessWidget {
  const NavLinkRetour({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
        child: ListTile(
          leading: Icon(Icons.backspace_rounded),
          title: Text(AppLocalizations.of(context)!.retour),
          tileColor: colorpanel(600),
          hoverColor: colorpanel(700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onTap: () => context.router.pop(),
        ));
  }
}
