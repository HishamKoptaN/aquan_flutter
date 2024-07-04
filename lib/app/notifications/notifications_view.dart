import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/notifications/model/notification.dart';
import 'package:aquan/app/Auth/User/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return AppLayout(
      route: t.notifications,
      showAppBar: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider(
          create: (context) => UserBloc()..add(GetNotifications()),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is NotificationsLoaded) {
                if (state.notifications.isEmpty) {
                  return Center(
                    child: Text(
                      t.noNotifications,
                      style: cartHeading,
                    ),
                  );
                }

                List<NotificationModel> notifications = state.notifications;

                return ListView.separated(
                  itemBuilder: (context, index) {
                    NotificationModel notification = notifications[index];

                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        notification.data!.message!,
                        style: const TextStyle(
                          color: black,
                          fontFamily: "Arial",
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Gap(15);
                  },
                  itemCount: notifications.length,
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
