import 'package:dobipay/src/features/home/view/widget/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF1F5F7),
        actions: [
          IconButton(
            splashRadius: 1,
            onPressed: () {
              context.push('/notification');
            },
            icon: Image.asset(
              'assets/icons/navbar/notification-active.png',
              width: 16,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _dateFilterToolbar(),
            _salesOverview(),
            _warningBanner(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 3,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const BarChartSample(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateFilterToolbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE8E9EC),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      activeIndex = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: activeIndex == 0
                          ? Colors.white
                          : Color(0xFFE8E9EC),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 79, 79, 79),
                        fontWeight: activeIndex == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      activeIndex = 1;
                    });
                  },
                  child: Container(
                    color: activeIndex == 1 ? Colors.white : Color(0xFFE8E9EC),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      "This Week",
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 79, 79, 79),
                        fontWeight: activeIndex == 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      activeIndex = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: activeIndex == 2
                          ? Colors.white
                          : Color(0xFFE8E9EC),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      "This Month",
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 79, 79, 79),
                        fontWeight: activeIndex == 2
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _salesOverview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFE8E9EC), width: 1),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Sales",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
            Text(
              "RM 234.00",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 41, 41, 41),
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/home/arrow-trend-up.svg",
                  width: 14,
                  height: 14,
                  colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
                ),
                SizedBox(width: 4),
                Text(
                  "5.6% from yesterday",
                  style: TextStyle(fontSize: 10, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 8,
                    color: Colors.blueAccent,
                    child: Container(),
                  ),
                ),
                Container(width: 130, height: 8, color: Colors.greenAccent),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFE8E9EC), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Online",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "RM 134.00",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 108, 108, 108),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/home/arrow-trend-up.svg",
                              width: 14,
                              height: 14,
                              colorFilter: ColorFilter.mode(
                                Colors.green,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "3.5% from yesterday",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFE8E9EC), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Offline",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "RM 100.00",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 108, 108, 108),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/home/arrow-trend-down.svg",
                              width: 14,
                              height: 14,
                              colorFilter: ColorFilter.mode(
                                Colors.red,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "2.5% from yesterday",
                              style: TextStyle(fontSize: 10, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _warningBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red[100]!, width: 1),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/home/warning.svg",
              width: 18,
              height: 18,
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
            ),
            SizedBox(width: 8),
            Text(
              "2 Washers and 1 Dryer are down for maintenance",
              style: TextStyle(
                fontSize: 12,
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
