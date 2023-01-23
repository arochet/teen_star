import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_colors.dart';
import 'package:teenstar/providers.dart';

class AppBarCycle extends ConsumerWidget {
  List<CycleDTO> listCyclesDTO;
  UniqueId idCycle;
  AppBarCycle({
    Key? key,
    required this.listCyclesDTO,
    required this.idCycle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //On aliment le Cycle PRECEDENT <- COURANT -> SUIVANT
    CycleDTO? cyclePrecedent;
    CycleDTO? cycleCourant;
    CycleDTO? cycleSuivant;
    for (var cycleDTO in listCyclesDTO) {
      if (cycleCourant != null && cycleSuivant == null) {
        cycleSuivant = cycleDTO;
      }
      if (cycleDTO.id == idCycle.getOrCrash()) {
        cycleCourant = cycleDTO;
      }
      if (cycleCourant == null) cyclePrecedent = cycleDTO;
    }

    //NEW APPBAR
    /* return ShowComponentFile(
      title: 'AppBarCycle',
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
          onTap: () {
            _ouvrirChoixCycle(context, ref);
          },
          child: Container(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cycle ${cycleCourant?.id}", style: Theme.of(context).textTheme.headline4),
                Icon(Icons.keyboard_arrow_down, size: 30, color: colorpanel(50)),
              ],
            ),
          ),
        ),
      ),
    ); */

    //OLD APPBAR / <- CYCLE COURANT ->
    return ShowComponentFile(
      title: 'AppBarCycle',
      child: //CYCLE COURANT
          Row(
        children: [
          SizedBox(width: 60),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //BOUTON CYCLE PRECEDENT
                  if (cyclePrecedent != null)
                    ElevatedButton(
                      onPressed: () {
                        ref.invalidate(cycleProvider(UniqueId.fromUniqueInt(cyclePrecedent!.id!)));
                        ref.read(idCycleCourant.notifier).state = UniqueId.fromUniqueInt(cyclePrecedent!.id!);
                      },
                      child: Icon(Icons.arrow_back_ios, size: 16, color: colorpanel(50)),
                      style: buttonPrimaryHideLittle,
                    ),
                  if (cyclePrecedent == null) Container(width: 64),
                  Flexible(
                    child: Text(
                      "Cycle ${cycleCourant?.id}",
                      style: Theme.of(context).textTheme.headline4,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  //BOUTON CYCLE SUIVANT
                  if (cycleSuivant == null) Container(width: 64),
                  if (cycleSuivant != null)
                    ElevatedButton(
                      onPressed: () {
                        ref.invalidate(cycleProvider(UniqueId.fromUniqueInt(cycleSuivant!.id!)));
                        ref.read(idCycleCourant.notifier).state = UniqueId.fromUniqueInt(cycleSuivant!.id!);
                      },
                      child: Icon(Icons.arrow_forward_ios, size: 16, color: colorpanel(50)),
                      style: buttonPrimaryHideLittle,
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _ouvrirChoixCycle(BuildContext context, WidgetRef ref) {
    return showDialogApp(
        context: context,
        titre: "Choisir un cycle",
        child: Container(
          height: 250,
          width: 130,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            itemCount: listCyclesDTO.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                ref.read(idCycleCourant.notifier).state = UniqueId.fromUniqueInt(listCyclesDTO[index].id!);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Cycle ${listCyclesDTO[index].id}"),
              ),
            ),
          ),
        ));
  }
}
