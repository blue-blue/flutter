import 'package:flutter/material.dart';
import 'package:template/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdapterPage extends StatefulWidget {
  const AdapterPage({Key key}) : super(key: key);

  @override
  _AdapterPageState createState() => _AdapterPageState();
}

class _AdapterPageState extends State<AdapterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.adapter),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: Text(
              "适配",
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              "未适配",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
