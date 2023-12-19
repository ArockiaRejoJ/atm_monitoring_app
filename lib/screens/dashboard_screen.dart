import 'package:atm_apk/widgets/app_drawer_widget.dart';
import 'package:atm_apk/widgets/dashboard_body_widget.dart';
import 'package:atm_apk/widgets/last_transactions_body_widget.dart';
import 'package:atm_apk/widgets/ticketing_body_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _pages = [
    const DashboardBodyWidget(),
    const LastTransactionsBodyWidget(),
    const TicketingBodyWidget(),
  ];
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: AppDrawerWidget(
        (index) => setState(() {
          _selectedPageIndex = index;
        }),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.subject,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
        ),
        title: _selectedPageIndex == 0
            ? const Text('Dashboard')
            : _selectedPageIndex == 1
                ? const Text('Last Transactions')
                : _selectedPageIndex == 2
                    ? const Text('Create Ticket')
                    : const Text(''),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.arrow_2_circlepath,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 5.w),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.tune,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedPageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horizontal_circle_outlined),
            label: 'Last Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num_outlined),
            label: 'Ticketing',
          ),
        ],
        currentIndex: _selectedPageIndex,
        selectedFontSize: 18.sp,
        selectedLabelStyle: TextStyle(fontSize: 12.sp),
        unselectedFontSize: 18.sp,
        unselectedLabelStyle: TextStyle(fontSize: 12.sp),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
