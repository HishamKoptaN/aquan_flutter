import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:aquan/features/notifications/bloc/notifications_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import '../bloc/notifications_bloc.dart';
import '../bloc/notifications_state.dart';
import '../controller/notifications_controller.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.notifications,
      showAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider(
          create: (context) => NotificationsBloc(
            notificationsController: NotificationsController(),
          )..add(
              const NotificationsEvent.getNotifications(),
            ),
          child: BlocConsumer<NotificationsBloc, NotificationsState>(
            listener: (context, state) {
              state.mapOrNull(
                error: (error) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ),
              );
            },
            builder: (context, state) {
              state.maybeWhen(
                loading: () {},
                loaded: (notifications) {
                  return ListView.separated(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      var notification = notifications[index];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          notification.message,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Arial",
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Gap(15);
                    },
                  );
                },
                orElse: () {},
              );
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
