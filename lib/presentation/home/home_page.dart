import 'package:auto_route/auto_route.dart';
import 'package:teenstar/PRESENTATION/auth/widget/check_connexion_widget.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShowEnvironment(
      child: ShowComponentFile(
        title: 'home/home_page.dart',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("TeenSTAR", style: Theme.of(context).textTheme.headline3!.copyWith(color: colorpanel(50))),
              ElevatedButton(
                onPressed: () {
                  context.router.push(ObservationListRoute());
                },
                child: Text("Observation List"),
                style: buttonNormalPrimary,
              ),
              ElevatedButton(
                onPressed: () {
                  context.router.push(ObservationAddRoute());
                },
                child: Text("Nouvelle Observation"),
                style: buttonNormalPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
