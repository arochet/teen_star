import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/DOMAIN/cycle/observation.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_error.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_core/router.gr.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widget/button_ajout_observation_journee.dart';
import 'widget/button_modification_observation.dart';
import 'widget/tableau_cycle.dart';

//Analyse
final showAnalyse = StateProvider<bool>((ref) => false);
final isSelection = StateProvider<bool>((ref) => false);
final observationSectionne = StateProvider<List<Observation>>((ref) => []);
final rangeDisplayObservation =
    StateProvider<int?>((ref) => null); //On affiche les observations entre les jours 1 et 10 (par exemple)

class CyclesPage extends ConsumerStatefulWidget {
  const CyclesPage({Key? key}) : super(key: key);

  @override
  _CyclesPageState createState() => _CyclesPageState();
}

class _CyclesPageState extends ConsumerState<CyclesPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _loadIdCycleCourant());
  }

  //Chargement de l'id du cycle choisit par l'utilisateur
  //La fonction vérifie si l'id du cycle courant est null
  _loadIdCycleCourant() async {
    //Mis à jour de ID cycle courant
    final idCycle = ref.read(idCycleCourant);

    if (idCycle == null) {
      final eitherCyclesDTO = await ref.read(cycleRepositoryProvider).readAllCycles();

      eitherCyclesDTO.fold((failure) => showSnackbarCycleFailure(context, failure), (listCycleDTO) {
        //On a la liste des cycles
        if (listCycleDTO.length > 0) {
          //Met à jour le cycle courant
          ref.read(idCycleCourant.notifier).state = UniqueId.fromUniqueInt(listCycleDTO.last.id!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Id du cycle en cours
    UniqueId? idCourant = ref.watch(idCycleCourant);
    AsyncValue<Either<CycleFailure, List<CycleDTO>>> listAsync = ref.watch(allCycleProvider);

    //LIST CYCLE DTO
    final listCycleWidget = listAsync.when(
      data: (data) {
        return data.fold(
          (error) => ShowError(error.toString()),
          (List<CycleDTO> listCyclesDTO) {
            if (listCyclesDTO.length == 0) {
              //PAGE : Pas de cycle
              return _PagePasDeCycle();
            } else {
              if (idCourant == null) {
                //PAGE : Erreur sur l'id du cycle courant
                return Center(child: Text("...", style: Theme.of(context).textTheme.headline4));
              } else {
                return _Cycle(listCyclesDTO, id: idCourant);
              }
            }
          },
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text(err.toString()),
    );

    return ShowComponentFile(
      title: './lib/PRESENTATION/cycle/cycle_page.dart',
      child: Padding(
        padding: EdgeInsets.all(10),
        child: listCycleWidget,
      ),
    );
  }
}

class _Cycle extends ConsumerWidget {
  List<CycleDTO> listCycleDTO;
  _Cycle(
    this.listCycleDTO, {
    Key? key,
    required this.id,
  }) : super(key: key);

  final UniqueId id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCycle = ref.watch(cycleProvider(id));
    final selection = ref.watch(isSelection);

    return asyncCycle.when(
      data: (cycleAsync) {
        return cycleAsync.fold(
          (error) => ShowError(error.toString()),
          (Cycle cycle) => Stack(
            children: [
              Column(
                children: [
                  //Bouton pour exporter le cycle en PDF
                  /* if (ref.watch(environment).name == Environment.dev)
                    Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            //DEV !!
                            final listeCycleEither = await ref.read(allCycleProvider.future);

                            listeCycleEither.fold(
                              (l) => showSnackbarCycleFailure(context, l),
                              (List<CycleDTO> listeCycle) async {
                                final listCycleAsync = await ref
                                    .read(cycleRepositoryProvider)
                                    .readListCycles(listeCycle.first.id!, listeCycle.last.id!);

                                final userData = await ref.read(currentUserData.future);
                                final passwordPdf = await ref.read(authRepositoryProvider).getPasswordPDF();
                                listCycleAsync.fold((l) => showSnackbarCycleFailure(context, l),
                                    (list) => generatePDF(userData, list, passwordPdf));
                              },
                            );
                          },
                          child: Text("Exporter PDF"),
                          style: buttonLittleSecondary),
                    ), */
                  //BOUTON DEVELOPPEUR
                  if (ref.watch(environment).name == Environment.dev)
                    Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            //DEV !!
                            // context.router.push(AuthInitRoute());
                            ref.read(cycleRepositoryProvider).showTables();
                          },
                          child: Text("Print Nom des tables"),
                          style: buttonLittleSecondary),
                    ),
                  _ShowAnalyse(),
                  _BarLongCycle(cycle),
                  if (selection)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Toucher l'observation à compléter ou modifier",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: actioncolor['primary'])),
                      ),
                    ),
                  //TABLEAU
                  Expanded(child: TableauCycle(cycle)),
                ],
              ),
              if (!selection) ButtonAjoutObservationJournee(),
              if (selection) ButtonModificationObservation(cycle),
            ],
          ),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text(err.toString()),
    );
  }
}

//Première utilisation de l'application
class _PagePasDeCycle extends StatelessWidget {
  _PagePasDeCycle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'PagePasDeCycle',
      child: Column(
        children: [
          Expanded(
            child: Center(
                child: Text("Ajoutez votre première observation !",
                    style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),
          ),
          ButtonAjoutObservationJournee(),
        ],
      ),
    );
  }
}

class _ShowAnalyse extends ConsumerStatefulWidget {
  const _ShowAnalyse({Key? key}) : super(key: key);

  @override
  __ShowAnalyseState createState() => __ShowAnalyseState();
}

class __ShowAnalyseState extends ConsumerState<_ShowAnalyse> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ref.read(showAnalyse.notifier).state = !ref.read(showAnalyse);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(ref.watch(showAnalyse) ? Icons.check_box : Icons.check_box_outline_blank,
                color: ref.watch(showAnalyse) ? actioncolor['primary'] : colorpanel(50)),
            SizedBox(width: 15),
            Flexible(
              child: Text("Afficher l'analyse", style: Theme.of(context).textTheme.headline5),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarLongCycle extends ConsumerStatefulWidget {
  final Cycle cycle;
  const _BarLongCycle(this.cycle, {Key? key}) : super(key: key);

  @override
  __BarLongCycleState createState() => __BarLongCycleState();
}

class __BarLongCycleState extends ConsumerState<_BarLongCycle> {
  @override
  Widget build(BuildContext context) {
    int nbDays = widget.cycle.getNumberOfDays(); //Lourd en calcul !
    const nbCyleDisplay = 35;
    final lenghtSubList = (nbDays / nbCyleDisplay).ceil();
    if (nbDays < nbCyleDisplay + 1)
      return Container();
    else {
      final List<int> list = List.generate(
        lenghtSubList,
        (index) => lenghtSubList - index,
      );
      return CupertinoSegmentedControl<int>(
        children: Map<int, Widget>.fromIterable(list,
            key: (v) => v,
            value: (v) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                  child: Text("${widget.cycle.id.getOrCrash()}.$v",
                      style: Theme.of(context).textTheme.headline6),
                )),
        onValueChanged: (int value) {
          ref.read(rangeDisplayObservation.notifier).state = value;
        },
        pressedColor: colorpanel(700),
        //selectedColor: colorpanel(700),
        borderColor: colorpanel(600),
        unselectedColor: colorpanel(900),
      );
    }
  }
}
