import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:aquan/features/Plans/presentation/bloc/plans_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../core/widgets/try_againwidget.dart';
import '../../../data/model/change_plan_request_body_model.dart';
import '../../bloc/plans_event.dart';
import '../../bloc/plans_state.dart';
import 'widgets/plans_data_widget.dart';

class PlansView extends StatefulWidget {
  const PlansView({super.key});
  @override
  State<PlansView> createState() => _PlansViewState();
}

class _PlansViewState extends State<PlansView> {
  @override
  void initState() {
    super.initState();
    ChangePlanRequestBodyModel().planInvoiceId = null;
  }

  @override
  Widget build(BuildContext context) {
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
              plansLoaded: () {
                return const PlansDataWidget();
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
                  child: CircularProgressIndicator(),
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
