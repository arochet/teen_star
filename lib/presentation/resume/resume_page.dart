import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_error.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widget/app_bar_cycle.dart';
import 'widget/appbar_analyse.dart';
import 'widget/button_ajout_observation_journee.dart';
import 'widget/tableau_cycle.dart';

//Analyse
final showAnalyse = StateProvider<bool>((ref) => false);

class ResumePage extends ConsumerStatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends ConsumerState<ResumePage> {
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
      final cycles = await ref.read(cycleRepositoryProvider).readAllCycles();

      cycles.fold((l) => showSnackbarCycleFailure(context, l), (listCycleDTO) {
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
      title: './lib/PRESENTATION/resume/resume_page.dart',
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

    return asyncCycle.when(
      data: (cycleAsync) {
        return cycleAsync.fold(
          (error) => ShowError(error.toString()),
          (Cycle cycle) => Stack(
            children: [
              Column(
                children: [
                  //APPBAR_LIST_CYCLES
                  AppBarCycle(listCyclesDTO: listCycleDTO, idCycle: id),
                  //APPBAR_ANALYSE
                  AppBarAnalyse(),
                  //TABLEAU
                  Expanded(child: TableauCycle(cycle)),
                ],
              ),
              ButtonAjoutObservationJournee(cycle),
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
  const _PagePasDeCycle({
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
                child: Text("Pas de Cycle\nVeuillez ajoutez une nouvelle observation",
                    style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center)),
          ),
          ButtonAjoutObservationJournee(null),
        ],
      ),
    );
  }
}
