import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class FindScanPage extends StatefulWidget {
  const FindScanPage({Key? key}) : super(key: key);

  @override
  _FindScanPageState createState() => _FindScanPageState();
}

class _FindScanPageState extends State<FindScanPage> {

  ScanController controller = ScanController();
  String qrcode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // custom wrap size
      height: 250,
      child: ScanView(
        controller: controller,
// custom scan area, if set to 1.0, will scan full area
        scanAreaScale: .7,
        scanLineColor: Colors.green.shade400,
        onCapture: (data) {
          // do something
          print('Scan:$data');
          Navigator.pop(context);
        },
      ),
    );
  }
}
