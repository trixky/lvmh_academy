import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class QRcodeScanner extends StatelessWidget {
  const QRcodeScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SfBarcodeGenerator(
      value: 'www.syncfusion.com',
      symbology: QRCode(),
      showValue: false,
    );
  }
}
