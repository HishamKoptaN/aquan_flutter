import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/level_details/bloc/subscrition_bloc.dart';
import 'app/level_details/bloc/subscrition_event.dart';
import 'app/level_details/bloc/subscrition_state.dart';

class MyAppThree extends StatefulWidget {
  const MyAppThree({super.key});

  @override
  _MyAppThreeState createState() => _MyAppThreeState();
}

class _MyAppThreeState extends State<MyAppThree> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Plan'),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) =>
              SubscritionDetailsBloc()..add(GetSubscribtionDetailsEvent()),
          child: BlocBuilder<SubscritionDetailsBloc, SubscritionDetailsState>(
            builder: (context, state) {
              if (state is SubscritionDetailsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SubscritionDetailsLoaded) {
                final subscription = state.subscribtionDetails;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Plan ID: ${subscription.planId}'),
                    Text(
                        'Start Date: ${subscription.startDate?.toString().split(' ')[0]}'),
                    Text(
                        'End Date: ${subscription.endDate?.toString().split(' ')[0]}'),
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
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
