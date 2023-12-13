import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/DOMAIN/cycle/cycle.dart';
import 'package:teenstar/DOMAIN/cycle/cycle_failure.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_dtos.dart';
import 'package:teenstar/INFRASTRUCTURE/cycle/observation_dtos.dart';
import 'package:teenstar/PRESENTATION/core/_components/dialogs.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_error.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_snackbar.dart';
import 'package:teenstar/PRESENTATION/core/_core/assets_path.dart';
import 'package:teenstar/PRESENTATION/cycle/widget/dialog_pdf.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widget/tableau_historique.dart';

class HistoriquePage extends ConsumerWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<CycleFailure, List<Cycle>>> listAsync = ref.watch(allCycleFullProvider);

    //LIST CYCLE DTO
    return ShowComponentFile(
      title: './lib/PRESENTATION/historique/historique_page.dart',
      child: Padding(
          padding: EdgeInsets.all(10),
          child: listAsync.when(
            data: (Either<CycleFailure, List<Cycle>> data) {
              return data.fold((error) => ShowError(error.toString()), (List<Cycle> listCycle) {
                if (listCycle.length == 0) {
                  //Pas de cycle
                  return Center(
                      child: Text(AppLocalizations.of(context)!.no_history,
                          style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center));
                } else {
                  listCycle = listCycle.reversed.toList();

                  //PAGE HISTORIQUE
                  return Column(
                    children: [
                      //ICONE EXPORT PDF
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () async {
                            final listeCycleEither = await ref.read(allCycleProvider.future);

                            listeCycleEither.fold(
                              (l) => showSnackbarCycleFailure(context, l),
                              (List<CycleDTO> listeCycle) async {
                                final listCycleAsync = await ref
                                    .read(cycleRepositoryProvider)
                                    .readListCycles(listeCycle.first.id!, listeCycle.last.id!);

                                final userData = await ref.read(currentUserData.future);
                                final passwordPdf = await ref.read(authRepositoryProvider).getPasswordPDF();

                                showDialogApp(
                                    context: context,
                                    titre: AppLocalizations.of(context)!.export_as_pdf,
                                    child: DialogPDF(listeCycle));
                              },
                            );
                          },
                          child: Image(
                            width: 60,
                            height: 35,
                            image: AssetImage(AssetsPath.icon_pdf),
                          ),
                        ),
                      ),
                      Expanded(child: TableauHistorique(listCycle)),
                    ],
                  );
                }
              });
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text(err.toString()),
          )),
    );
  }
}
