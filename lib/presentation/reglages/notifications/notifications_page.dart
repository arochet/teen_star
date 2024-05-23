import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:teenstar/PRESENTATION/core/_components/default_panel.dart';
import 'package:teenstar/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:teenstar/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teenstar/PRESENTATION/core/_components/spacing.dart';
import 'package:teenstar/PRESENTATION/core/_core/theme_button.dart';
import 'package:teenstar/PRESENTATION/reglages/modify_account/modify_account_form.dart';
import 'package:teenstar/PRESENTATION/reglages/notifications/utilities.dart';
import 'package:teenstar/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  List<NotificationModel> listNotifications = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await _getAllNotifications();
      setState(() {});
    });
  }

  _getAllNotifications() async {
    listNotifications = await AwesomeNotifications().listScheduledNotifications();
    listNotifications.sort((a, b) => ((a.schedule as NotificationCalendar)?.weekday ?? 0)
        .compareTo((b.schedule as NotificationCalendar)?.weekday ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.notification,
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
              child: DefaultPanel(
                  color: ref.watch(themeApp).value?.color2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(AppLocalizations.of(context)!.notification,
                            style: Theme.of(context).textTheme.titleSmall),
                        SpaceH10(),
                        Text(
                            AppLocalizations.of(context)!
                                .activate_notifications_to_receive_alerts_and_reminders,
                            style: Theme.of(context).textTheme.bodyMedium),
                        SpaceH10(),
                        Text(
                            listNotifications.length > 0
                                ? '${AppLocalizations.of(context)!.notification_scheduled} \n\n${listNotifications.map((e) => '${([
                                      '--',
                                      AppLocalizations.of(context)!.monday,
                                      AppLocalizations.of(context)!.tuesday,
                                      AppLocalizations.of(context)!.wednesday,
                                      AppLocalizations.of(context)!.thursday,
                                      AppLocalizations.of(context)!.friday,
                                      AppLocalizations.of(context)!.saturday,
                                      AppLocalizations.of(context)!.sunday,
                                    ])[(e.schedule as NotificationCalendar)?.weekday ?? 0]} ${(e.schedule as NotificationCalendar)?.hour}h${(e.schedule as NotificationCalendar)?.minute.toString().padLeft(2, '0')}').join('\n')} \n\n'
                                : AppLocalizations.of(context)!.no_notification_scheduled,
                            style: Theme.of(context).textTheme.bodyMedium),
                        SpaceH10(),

                        //Bouton Ajouter une nouvelle notification
                        ElevatedButton(
                          onPressed: () async {
                            NotificationWeekAndTime? pickedSchedule = await pickSchedule(context);

                            if (pickedSchedule != null) {
                              await createReminderNotification(pickedSchedule);
                              await _getAllNotifications();
                              setState(() {});
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.schedule_a_reminder),
                          style: buttonNormalPrimary,
                        ),
                        SpaceH10(),

                        //Bouton Supprimer les notifications
                        ElevatedButton(
                          onPressed: () async {
                            await cancelScheduledNotifications();
                            listNotifications = await AwesomeNotifications().listScheduledNotifications();
                            setState(() {});
                          },
                          child: Text(AppLocalizations.of(context)!.cancel_all_reminders),
                          style: buttonNormalPrimary,
                        ),
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }

  Future<List<Widget>> _getScheduledNotifications() async {
    List<NotificationModel> scheduledNotifications =
        await AwesomeNotifications().listScheduledNotifications();

    return scheduledNotifications
        .map((notif) => DefaultPanel(
              child: Text("${AppLocalizations.of(context)!.notification}: ${notif.content?.title}",
                  style: Theme.of(context).textTheme.bodyMedium),
            ))
        .toList();
  }
}

Future<void> createPlantFoodNotification() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduled_channel',
          title: ' Buy Plant Food !!',
          icon: null,
          body: 'Florist at 123, Main St. has 2 in stock',
          bigPicture: 'asset://assets/notification_map.png',
          notificationLayout: NotificationLayout.BigPicture));
}

Future<void> createReminderNotification(NotificationWeekAndTime notificationScheduled) async {
  for (int i = 1; i < 8; i++) {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: 'Kyklos',
        body: '',
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        )
      ],
      schedule: NotificationCalendar(
        weekday: i,
        hour: notificationScheduled.timeOfDay.hour,
        minute: notificationScheduled.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}
