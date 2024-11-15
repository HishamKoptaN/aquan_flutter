import 'package:aquan/core/singletons/trans_singleton.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/singletons/user_singleton.dart';
import '../../../../core/widgets/custom_circular_progress.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../Plans/presentation/view/plans_view/plans_view.dart';
import '../../../deposit/view/make_deposit_view.dart';
import '../../../profile/profile_view.dart';
import '../../../trans/presentation/bloc/trans_bloc.dart';
import '../../../trans/presentation/bloc/trans_event.dart';
import '../../../trans/presentation/bloc/trans_state.dart';
import '../../../trans/presentation/view/trans_view.dart';
import '../../../withdraw/view/make_withdraw.dart';
import '../bloc/dash_bloc.dart';
import '../bloc/dash_state.dart';
import 'widgets/rates_widget.dart';

class DashView extends StatefulWidget {
  const DashView({super.key});
  @override
  State<DashView> createState() => _DashViewState();
}

class _DashViewState extends State<DashView> {
  bool copy = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AppLayout(
      route: t.home,
      showAppBar: false,
      body: BlocConsumer<DashBloc, DashState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {},
            failure: (e) {},
          );
        },
        builder: (context, state) {
          return ListView(
            children: [
              Container(
                height: height / 2.5,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.amber,
                      Colors.amber,
                      Colors.amber,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          55, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: const BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfileView(),
                                              ),
                                            ).then(
                                                (value) => setState(() => {}));
                                          },
                                          icon: FaIcon(
                                            FontAwesomeIcons.user,
                                            color: Colors.white,
                                            size: 16.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    UserSingleton.instance.user!.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            children: [
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(0.0, 3.0),
                                  child: Text(
                                    t.welcome,
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: t.aquan,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PlansView(),
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(55, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "LV${UserSingleton.instance.user?.planId}",
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      t.balance,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Text(
                        NumberFormat.simpleCurrency(
                          locale: "en",
                          decimalDigits: 0,
                        ).format(
                          UserSingleton.instance.user?.balance,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            UserSingleton.instance.user!.accountNumber
                                .toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              setState(
                                () {
                                  copy = true;
                                },
                              );
                              Clipboard.setData(
                                ClipboardData(
                                  text: UserSingleton
                                      .instance.user!.accountNumber,
                                ),
                              );
                              Future.delayed(
                                const Duration(
                                  milliseconds: 500,
                                ),
                                () {
                                  setState(
                                    () {
                                      copy = false;
                                    },
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              copy
                                  ? FontAwesomeIcons.check
                                  : FontAwesomeIcons.copy,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MakeDepositView(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color.fromARGB(
                                48,
                                255,
                                255,
                                255,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.circleArrowUp,
                                    color: Colors.black,
                                    size: 50.sp,
                                  ),
                                  Text(
                                    t.deposit,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MakeWithdrawView(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color.fromARGB(
                                48,
                                255,
                                255,
                                255,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.circleArrowDown,
                                    color: Colors.black,
                                    size: 50.sp,
                                  ),
                                  Text(
                                    t.withdraw,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(5),
              Container(
                padding: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.black, width: 4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: t.last2Transactions,
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    TextButton(
                      onPressed: () {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TransactionsView(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        t.showAll,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const LastTwoOperationWidget(),
              const Gap(5),
              Container(
                padding: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.black, width: 4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: t.changeRate,
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              RatesWidget(t: t),
            ],
          );
        },
      ),
    );
  }
}

class LastTwoOperationWidget extends StatelessWidget {
  const LastTwoOperationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransBloc, TransState>(
      listener: (context, state) {
        state.whenOrNull();
      },
      builder: (context, state) {
        state.whenOrNull(
          initial: () {
            context.read<TransBloc>().add(
                  const TransEvent.get(),
                );
          },
        );
        return state.maybeWhen(
          orElse: () {
            return const CustomCircularProgress();
          },
          dataLoaded: () {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                final transfer = TransDataStorage().trans![index];
                String formattedAmount =
                    NumberFormat('#,##0').format(transfer.amount);
                return Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(
                        text: "$formattedAmount\$",
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(5.w),
                      CustomText(
                        text: transfer.id.toString(),
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(5.w),
                      Column(
                        children: [
                          CustomText(
                            text: transfer.receiverCurrency.name,
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          Gap(5.h),
                          CustomText(
                            text: transfer.createdAt,
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
