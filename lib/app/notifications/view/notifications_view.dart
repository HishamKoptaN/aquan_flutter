import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import '../bloc/notifications_bloc.dart';
import '../bloc/notifications_state.dart';

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
          create: (context) => NotificationsBloc()..add(GetNotifications()),
          child: BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
              if (state is NotificationsLoadedSuccess) {
                return ListView.separated(
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) {
                    var notification = state.notifications[index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        notification.data!,
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
