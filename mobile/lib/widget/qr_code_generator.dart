import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class QRcodeGenerator extends StatelessWidget {
  const QRcodeGenerator({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final String sanitizedUrl = url.replaceAll(" ", ".");

    return SfBarcodeGenerator(
      value: sanitizedUrl,
      symbology: QRCode(),
      showValue: false,
    );
  }
}
