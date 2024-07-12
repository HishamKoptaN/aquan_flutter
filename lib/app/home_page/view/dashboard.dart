import 'package:aquan/Helpers/colors.dart';
import 'package:aquan/Helpers/styles.dart';
import 'package:aquan/app/Layouts/app_layout.dart';
import 'package:aquan/app/Auth/model/user.dart';
import 'package:aquan/app/deposit/view/deposit_view.dart';
import 'package:aquan/app/transaction/view/transactions_view.dart';
import 'package:aquan/app/withdraw/view/withdraw_view.dart';
import 'package:aquan/app/Auth/User/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../profile/profile_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool copy = false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    return AppLayout(
      route: t.home,
      showAppBar: false,
      body: BlocProvider<UserBloc>(
        create: (context) => UserBloc()..add(Dashboard()),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is DashboardLoaded) {
              User user = state.user;
              List<Widget> trList = [];
              List<Widget> currList = [];
              state.transactions.every(
                (tr) {
                  trList.add(
                    Container(
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
                              Container(
                                width: 50.0.w,
                                height: 50.0.h,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  image: DecorationImage(
                                    image: NetworkImage(state.user.image!),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                              ),
                              const Gap(5),
                              Column(
                                children: [
                                  Text(
                                    t.transferFromBankToBank,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    tr.createdDate!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            tr.amountFormated!,
                            style: cartHeading,
                          )
                        ],
                      ),
                    ),
                  );
                  return true;
                },
              );
              state.currencies.every(
                (curr) {
                  if (curr.name?.toLowerCase() == "bankak" ||
                      curr.name?.toLowerCase() == "بنكك") {
                    return true;
                  }
                  Map<String, dynamic> rate =
                      curr.rates?[state.user.planId.toString()];
                  currList.add(
                    Container(
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
                                  Text(
                                    curr.name!,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    "${t.lastUpdate} ${curr.updatedDate!}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    t.sell,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    curr.sellingRate.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(10),
                              Column(
                                children: [
                                  Text(
                                    t.buy,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    curr.buyingRate.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                  return true;
                },
              );
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
                                                BorderRadius.circular(10)),
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
                                                        const ProfileScreen(),
                                                  ),
                                                ).then((value) =>
                                                    setState(() => {}));
                                              },
                                              icon: FaIcon(
                                                FontAwesomeIcons.user,
                                                color: white,
                                                size: 16.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        user.name!.split(' ')[0],
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(55, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(10)),
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
                                                  "LV${user.planId.toString()}",
                                              // النص الثاني
                                              style: TextStyle(
                                                fontSize:
                                                    10.sp, // حجم النص الثاني
                                                color: Colors
                                                    .white, // لون النص الثاني
                                                fontWeight: FontWeight
                                                    .bold, // جعل النص غامق
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
                          ],
                        ),
                        Text(
                          t.balance,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(.0),
                          child: Text(
                            NumberFormat.simpleCurrency(
                                    locale: "en", decimalDigits: 3)
                                .format(user.balance),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: black,
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
                                user.id.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: black,
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
                                    ClipboardData(text: user.id.toString()),
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
                                  color: black,
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
                                WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DepositScreen(
                                        currencies: state.currencies,
                                        user: state.user,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: const Color.fromARGB(
                                        48, 255, 255, 255)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.circleArrowUp,
                                        color: black,
                                        size: 50.sp,
                                      ),
                                      Text(
                                        t.deposit,
                                        style: TextStyle(
                                          color: black,
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
                                WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => WithdrawScreen(
                                        currencies: state.currencies,
                                        user: state.user,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: const Color.fromARGB(
                                        48, 255, 255, 255)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.circleArrowDown,
                                        color: black,
                                        size: 50.sp,
                                      ),
                                      Text(
                                        t.withdraw,
                                        style: TextStyle(
                                          color: black,
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
                        right: BorderSide(color: black, width: 4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          t.last2Transactions,
                          style: const TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransactionsScreen(),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            t.showAll,
                            style: const TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  Column(
                    children: trList.isEmpty
                        ? [
                            Text(
                              t.noTransactions,
                              style:
                                  const TextStyle(color: black, fontSize: 18),
                            )
                          ]
                        : trList,
                  ),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: black, width: 4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          t.changeRate,
                          style: const TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  Column(
                    children: currList.isEmpty
                        ? [
                            Text(
                              t.noCurrencies,
                              style:
                                  const TextStyle(color: black, fontSize: 18),
                            )
                          ]
                        : currList,
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          },
        ),
      ),
    );
  }
}

class BalanceText extends StatelessWidget {
  final double balance;

  BalanceText({required this.balance});

  @override
  Widget build(BuildContext context) {
    String formattedBalance =
        NumberFormat.currency(locale: 'ar', symbol: 'ر.س').format(balance);

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Text(
        formattedBalance,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
