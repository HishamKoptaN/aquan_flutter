import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/custom_circular_progress.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/try_againwidget.dart';
import '../../../../layouts/app_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/plans_bloc.dart';
import '../../bloc/plans_event.dart';
import '../../bloc/plans_state.dart';
import 'widgets/plans_data_widget.dart';
import '../../../data/model/plan.dart';

class PlansView extends StatefulWidget {
  const PlansView({
    super.key,
  });
  @override
  State<PlansView> createState() => _PlansViewState();
}

class _PlansViewState extends State<PlansView> {
  @override
  Widget build(context) {
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.subscriptions,
      showAppBar: true,
      body: BlocProvider<PlansBloc>(
        create: (context) => PlansBloc(
          getIt(),
          getIt(),
          getIt(),
        )..add(
            const PlansEvent.get(),
          ),
        child: BlocConsumer<PlansBloc, PlansState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('successfully'),
                    duration: Duration(seconds: 4),
                  ),
                );
              },
              failure: (apiErrorModel) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('successfully'),
                    duration: Duration(seconds: 4),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              plansLoaded: (plans) {
                return PlansDataWidget(
                  plans: plans,
                );
              },
              failure: (error) {
                return Center(
                  child: CustomText(
                    text: 'An error occurred',
                    fontSize: 10.sp,
                    color: Colors.red,
                  ),
                );
              },
              loading: () {
                return const Center(
                  child: CustomCircularProgress(),
                );
              },
              orElse: () {
                return const TryAgain();
              },
            );
          },
        ),
      ),
    );
  }
}
