import 'package:atm_apk/providers/atm_details_provider.dart';
import 'package:atm_apk/widgets/app_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ATMSummaryScreen extends StatefulWidget {
  const ATMSummaryScreen({Key? key}) : super(key: key);

  @override
  State<ATMSummaryScreen> createState() => _ATMSummaryScreenState();
}

class _ATMSummaryScreenState extends State<ATMSummaryScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Future? _atmFuture;
  Future _obtainATMFuture() async {
    return await Provider.of<AtmDetailsProvider>(context, listen: false)
        .fetchATMData();
  }

  @override
  void initState() {
    _atmFuture = _obtainATMFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final atmDatas = Provider.of<AtmDetailsProvider>(context).listOfATMs;
    return Scaffold(
      key: scaffoldKey,
      drawer: AppDrawerWidget(
        (index) => setState(() {
          final val = index;
        }),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              // scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.subject,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
        ),
        title: const Text('In Service ATM Details'),
        centerTitle: true,
        actions: [
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 40.h,
            width: 360.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(3, 0),
                    blurRadius: 4,
                    color: Colors.grey[300]!)
              ],
              color: Colors.white,
            ),
            padding: EdgeInsets.only(left: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Number Of ATMs',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Consumer<AtmDetailsProvider>(builder: (context, atmData, _) {
                  return Text(
                    "${atmData.listOfATMs.length}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Expanded(
            child: FutureBuilder(
              future: _atmFuture,
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (dataSnapshot.error != null) {
                    return const Center(
                      child: Text('an error occurred'),
                    );
                  } else {
                    return Consumer<AtmDetailsProvider>(
                      builder: (context, atmData, _) {
                        return atmData.listOfATMs.isEmpty
                            ? const Center(
                                child: Text('No data'),
                              )
                            : ListView.builder(
                                itemCount: atmData.listOfATMs.length,
                                itemBuilder: (_, index) => Padding(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: SizedBox(
                                        height: 45.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 40.h,
                                              child: VerticalDivider(
                                                  width: 25.h,
                                                  thickness: 2,
                                                  color: Colors.red[300]),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.computer,
                                                      size: 16.sp,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                        "${atmDatas[index].id!}")
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      size: 16.sp,
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Text(
                                                        "${atmDatas[index].location!}")
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
