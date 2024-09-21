import 'package:aquan/core/utils/app_colors.dart';
import 'package:aquan/features/Layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../Plans/view/plans_view.dart';
import '../../deposit/view/make_deposit_view.dart';
import '../../profile/profile_view.dart';
import '../../transactions/view/transactions_view.dart';
import '../../withdraw/view/make_withdraw.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_state.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool copy = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    return AppLayout(
      route: t.home,
      showAppBar: false,
      body: BlocProvider<DashboardBloc>(
        create: (context) => DashboardBloc()..add(GetDashboardDetails()),
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoaded) {
              return ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  Container(
                    width: size.width,
                    height: size.height / 2.5,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                ).then((value) =>
                                                    setState(() => {}));
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
                                        state.localData['name'] ?? "",
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
                                            fontSize: 16.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: t.aquan,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
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
                                    color:
                                        const Color.fromARGB(55, 255, 255, 255),
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
                                                    "LV${state.localData['plan_id'] ?? ""}",
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
                                    locale: "en", decimalDigits: 0)
                                .format(state.localData['balance'] ?? "0.0"),
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
                                state.localData['account_number'] ?? "",
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
                                      text: state.localData['account_number'],
                                    ),
                                  );
                                  Future.delayed(
                                    const Duration(milliseconds: 500),
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
                                    builder: (context) => MakeDepositView(
                                      currencies: state
                                          .getDashboardApiResModel.currencies!,
                                    ),
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
                                    builder: (context) => MakeWithdrawView(
                                      currencies: state
                                          .getDashboardApiResModel.currencies!,
                                    ),
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
                        MyText(
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
                                  builder: (context) =>
                                      const TransactionsView(),
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
                  ListView.builder(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.getDashboardApiResModel.transfers!.length,
                    itemBuilder: (context, index) {
                      final transfer =
                          state.getDashboardApiResModel.transfers![index];
                      final formattedAmount =
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
                            MyText(
                              text: "$formattedAmount\$",
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            Gap(5.w),
                            MyText(
                              text: transfer.id.toString(),
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            Gap(5.w),
                            Column(
                              children: [
                                MyText(
                                  text: transfer.receiverCurrency!.name!,
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                Gap(5.h),
                                MyText(
                                  text: transfer.createdAt!,
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
                        MyText(
                          text: t.changeRate,
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        state.getDashboardApiResModel.exchangeRates!.length,
                    itemBuilder: (context, index) {
                      var exchangeRate =
                          state.getDashboardApiResModel.exchangeRates![index];
                      var comission = state.getDashboardApiResModel.commission!;
                      final sellingRateValue = double.parse(
                        state.getDashboardApiResModel.sellingRates!
                            .firstWhere(
                              (sellingRate) =>
                                  sellingRate.from == exchangeRate.id,
                            )
                            .selling!,
                      );
                      final buyingRateValue = double.parse(
                        state.getDashboardApiResModel.buyingRates!
                            .firstWhere(
                              (buyingRate) => buyingRate.to == exchangeRate.id,
                            )
                            .selling!,
                      );
                      final formattedSellingRate = NumberFormat('#,##0').format(
                        ((sellingRateValue / 100) * comission -
                                sellingRateValue)
                            .abs(),
                      );

                      final formattedBuyingRate = NumberFormat('#,##0').format(
                        ((buyingRateValue / 100) * comission + buyingRateValue)
                            .abs(),
                      );
                      return Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Gap(5.h),
                                    MyText(
                                      text: exchangeRate.name!,
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Gap(5.h),
                                    MyText(
                                      text: t.lastUpdate,
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      maxLines: 2,
                                    ),
                                    MyText(
                                      text: " ${exchangeRate.updatedAt}",
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    MyText(
                                      text: t.sell,
                                      fontSize: 16.sp,
                                      color: Colors.red,
                                    ),
                                    MyText(
                                      text: formattedSellingRate,
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                const Gap(10),
                                Column(
                                  children: [
                                    MyText(
                                      text: t.buy,
                                      fontSize: 16.sp,
                                      color: Colors.green,
                                    ),
                                    MyText(
                                      text: formattedBuyingRate,
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            } else if (state is DashboardError) {
              return Center(child: Text(t.error));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
