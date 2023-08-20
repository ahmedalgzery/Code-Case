import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gst/screens/home/widgets/custom_button_percent.dart';
import 'package:gst/screens/home/widgets/custom_gst.dart';

class GstScreen extends StatefulWidget {
  const GstScreen({super.key});

  @override
  State<GstScreen> createState() => _GstScreenState();
}

class _GstScreenState extends State<GstScreen> {
  TextEditingController taxableController = TextEditingController();
  TextEditingController cessController = TextEditingController();
  double taxableAmount = 0.0, netAmount = 0.0, cess = 0.0, mainCess = 3.0;
  bool status = true;
  int isSlected = 1;

  void increase() {
    netAmount = taxableAmount + mainCess + cess;
    setState(() {});
  }

  void decrease() {
    netAmount = taxableAmount - mainCess - cess;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'GST Calculator',
          style: TextStyle(color: Colors.black, fontSize: 30.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(18.0.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                height: 360.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 3),
                        blurRadius: 3,
                      ),
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 180.w,
                          child: TextFormField(
                            controller: taxableController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              taxableAmount = double.parse(value);
                              status ? increase() : decrease();
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter Taxable Amount ',
                              label: const Text('Enter Taxable Amount '),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: TextFormField(
                            controller: cessController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              cess = double.parse(value);
                              status ? increase() : decrease();
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Enter Cess % ',
                              label: const Text('Enter Cess %'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            status = true;
                            increase();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: status
                                ? Colors.greenAccent
                                : Colors.white.withOpacity(.9),
                          ),
                          child: Text(
                            'Add GST',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.sp),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            status = false;
                            decrease();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: status
                                  ? Colors.white.withOpacity(.9)
                                  : Colors.greenAccent),
                          child: Text(
                            'Remove GST',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButtonPercent(
                          text: '3.0%',
                          index: 1,
                          isSlected: isSlected,
                          onTap: () {
                            isSlected = 1;
                            mainCess = 3.0;
                            status ? increase() : decrease();
                          },
                        ),
                        CustomButtonPercent(
                          text: '5.0%',
                          index: 2,
                          isSlected: isSlected,
                          onTap: () {
                            isSlected = 2;
                            mainCess = 5.0;
                            status ? increase() : decrease();
                          },
                        ),
                        CustomButtonPercent(
                          text: '12.0%',
                          index: 3,
                          isSlected: isSlected,
                          onTap: () {
                            isSlected = 3;
                            mainCess = 12.0;
                            status ? increase() : decrease();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButtonPercent(
                          text: '18.0%',
                          index: 4,
                          isSlected: isSlected,
                          onTap: () {
                            isSlected = 4;
                            mainCess = 18.0;
                            status ? increase() : decrease();
                          },
                        ),
                        CustomButtonPercent(
                          text: '28.0%',
                          index: 5,
                          isSlected: isSlected,
                          onTap: () {
                            isSlected = 5;
                            mainCess = 28.0;
                            status ? increase() : decrease();
                          },
                        ),
                        CustomButtonPercent(
                          text: '31.0%',
                          index: 6,
                          isSlected: isSlected,
                          onTap: () {
                            isSlected = 6;
                            mainCess = 31.0;
                            status ? increase() : decrease();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 3),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Taxable Amount',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '$taxableAmount',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Net Amount',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '$netAmount',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                height: 400.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 3),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomGst(
                              text: 'GST Rate',
                            ),
                            CustomGst(
                              text: '$mainCess %',
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomGst(
                              text: 'GST Amount',
                            ),
                            CustomGst(
                              text: '$mainCess',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomGst(
                              text: 'CGST',
                            ),
                            CustomGst(
                              text: '${(mainCess / 2).ceil()}',
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomGst(
                              text: 'SGST',
                            ),
                            CustomGst(
                              text: '${(mainCess / 2).ceil()}',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomGst(
                              text: 'IGST',
                            ),
                            CustomGst(
                              text: '$mainCess',
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CustomGst(
                              text: 'CESS',
                            ),
                            CustomGst(
                              text: '$cess',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
