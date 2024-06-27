import 'dart:io';
import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/Plans/bloc/plan_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:motion_toast/resources/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../model/plan.dart';

class ChangePlanScreen extends StatefulWidget {
  const ChangePlanScreen({super.key, required this.plan});
  final Plan plan;
  @override
  State<ChangePlanScreen> createState() => _ChangePlanScreenState();
}

class _ChangePlanScreenState extends State<ChangePlanScreen> {
  File? file;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return AppLayout(
      route: t.subscriptions,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: BlocProvider<PlanBloc>(
          create: (context) => PlanBloc()..add(GetPaymentMethods()),
          child: BlocBuilder<PlanBloc, PlanState>(
            builder: (context, state) {
              String? error;
              if (state is PaymentDone) {
                return Container(
                  width: size.width,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: successColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    state.message!,
                    style: const TextStyle(
                      color: white,
                    ),
                  ),
                );
              }
              if (state is PlanError) {
                error = state.message;
              }
              if (state is PaymentMethodsDone) {
                List<Widget> childs = [];
                if (error != null) {
                  childs.add(
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: successColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        error,
                        style: const TextStyle(
                          color: white,
                        ),
                      ),
                    ),
                  );
                }
                state.methods.every((method) {
                  childs.add(
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            method.name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: black,
                              fontSize: 16,
                            ),
                          ),
                          const Gap(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await Clipboard.setData(
                                    ClipboardData(
                                      text: method.paymentInfo!.name!,
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.copy,
                                  size: 20,
                                ),
                              ),
                              Text(
                                method.paymentInfo!.name!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await Clipboard.setData(
                                    ClipboardData(
                                      text: method.paymentInfo!.accountId!,
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.copy,
                                  size: 20,
                                ),
                              ),
                              Text(
                                method.paymentInfo!.accountId!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Gap(5),
                          Text(
                            widget.plan.amountFormated!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  return true;
                });

                childs.add(Column(
                  children: [
                    const Gap(10),
                    Text(
                      t.uploadPaymentProof,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Gap(20),
                    InkWell(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          File file = File(result.files.single.path!);

                          setState(() {
                            this.file = file;
                          });
                        }
                      },
                      child: Container(
                        width: size.width,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: black,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.cloudArrowUp),
                            const Gap(5),
                            Text(t.chooseImage),
                          ],
                        ),
                      ),
                    ),
                    const Gap(10),
                    SizedBox(
                      width: size.width,
                      child: TextButton(
                        onPressed: () {
                          if (file != null) {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) => context.read<PlanBloc>().add(
                                    PayPlan(
                                      plan: widget.plan,
                                      image: file!,
                                    ),
                                  ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          t.submit,
                          style: const TextStyle(
                            color: black,
                            fontFamily: "Arial",
                          ),
                        ),
                      ),
                    ),
                    const Gap(50),
                  ],
                ));
                return ListView(
                  children: childs,
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
