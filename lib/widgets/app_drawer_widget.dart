import 'package:atm_apk/screens/atm_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawerWidget extends StatefulWidget {
  final Function(int) callback;
  const AppDrawerWidget(this.callback, {super.key});

  @override
  State<AppDrawerWidget> createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.w),
                  const CircleAvatar(
                    maxRadius: 30,
                    minRadius: 28,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nadeem Hafiz',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5.h),
                      const Text(
                        "test@gmail.com",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              const Divider(color: Color(0xFF002463), thickness: 0.5),
              Padding(
                padding: const EdgeInsets.only(left: 16.5),
                child: InkWell(
                  onTap: () {
                    widget.callback(0);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(color: Color(0xFF002463), thickness: 0.5),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.5),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ATMSummaryScreen();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.atm,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'ATM Summary',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(color: Color(0xFF002463), thickness: 0.5),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.5),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_atm,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'ATM Cash Summary',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(color: Color(0xFF002463), thickness: 0.5),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.5),
                child: InkWell(
                  onTap: () {
                    widget.callback(2);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.confirmation_num_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Ticketing',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 15.w,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(color: Color(0xFF002463), thickness: 0.5),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.5),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const DeliveryTimeSlot();
                    //     },
                    //   ),
                    // );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.lan_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 20.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Systems Monitoring',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(color: Color(0xFF002463), thickness: 0.5),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.5),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const BannerAddition();
                    //     },
                    //   ),
                    // );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(color: Color(0xFF002463), thickness: 0.5),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.5),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const ProductAddition();
                    //     },
                    //   ),
                    // );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.file_open_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Reports",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 15.w,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Divider(color: Color(0xFF002463), thickness: 0.5),
              const SizedBox(height: 2.5),
            ],
          ),
        ),
      ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text('Do you want to Logout?'),
        actions: [
          TextButton(
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () {},
          ),
          TextButton(
            child: const Text(
              "No",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
