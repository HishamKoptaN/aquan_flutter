import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/utils/app_colors.dart';
import '../bloc/subscrition_bloc.dart';
import '../bloc/subscrition_event.dart';
import '../bloc/subscrition_state.dart';

class SubscribtionView extends StatelessWidget {
  const SubscribtionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.notifications,
      showAppBar: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider(
          create: (context) =>
              SubscritionDetailsBloc()..add(GetSubscribtionDetailsEvent()),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Text('Get'),
              ),
              BlocBuilder<SubscritionDetailsBloc, SubscritionDetailsState>(
                builder: (context, state) {
                  if (state is SubscritionDetailsLoaded) {
                    final subscription = state.subscribtionDetails;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Plan ID: ${subscription.planId}'),
                        Text('Start Date: ${subscription.startDate}'),
                        Text('End Date: ${subscription.endDate}'),
                      ],
                    );
                  } else if (state is SubscritionDetailsError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
