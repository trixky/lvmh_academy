import 'dart:convert';
import 'dart:developer';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;

Future<dynamic> nfcRead222() async {
  var availability = await FlutterNfcKit.nfcAvailability;
  if (availability != NFCAvailability.available) {
    // oh-no
  }
  log("-------------- 0");

// timeout only works on Android, while the latter two messages are only for iOS
  var tag = await FlutterNfcKit.poll(
      timeout: Duration(seconds: 10),
      iosMultipleTagMessage: "Multiple tags found!",
      iosAlertMessage: "Scan your tag");

  log("-------------- 1");

  print(jsonEncode(tag));
  if (tag.type == NFCTagType.iso7816) {
    var result = await FlutterNfcKit.transceive("00B0950000",
        timeout: Duration(
            seconds:
                5)); // timeout is still Android-only, persist until next change
    print(result);
  }

  log("-------------- 2");

// iOS only: set alert message on-the-fly
// this will persist until finish()
  await FlutterNfcKit.setIosAlertMessage("hi there!");

  log("-------------- 3");

// read NDEF records if available
  if (tag.ndefAvailable != null && tag.ndefAvailable!) {
    log("-------------- 4");

    /// decoded NDEF records (see [ndef.NDEFRecord] for details)
    /// `UriRecord: id=(empty) typeNameFormat=TypeNameFormat.nfcWellKnown type=U uri=https://github.com/nfcim/ndef`
    for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
      print(record.toString());
    }
    log("-------------- 5");

    /// raw NDEF records (data in hex string)
    /// `{identifier: "", payload: "00010203", type: "0001", typeNameFormat: "nfcWellKnown"}`
    for (var record in await FlutterNfcKit.readNDEFRawRecords(cached: false)) {
      print(jsonEncode(record).toString());
    }
  }

  log("-------------- 6");

// write NDEF records if applicable
  // if (tag.ndefWritable != null && tag.ndefWritable!) {
  //   // decoded NDEF records
  //   await FlutterNfcKit.writeNDEFRecords([
  //     new ndef.UriRecord.fromUriString(
  //         "https://github.com/nfcim/flutter_nfc_kit")
  //   ]);
  //   // raw NDEF records
  //   await FlutterNfcKit.writeNDEFRawRecords([
  //     new NDEFRawRecord(
  //         "00", "0001", "0002", "0003", ndef.TypeNameFormat.unknown)
  //   ]);
  // }

// read / write block / page / sector level data
// see documentation for platform-specific supportability
  // if (tag.type == NFCTagType.iso15693) {
  //   await FlutterNfcKit.writeBlock(
  //       1, // index
  //       [0xde, 0xad, 0xbe, 0xff], // data
  //       iso15693Flags: Iso15693RequestFlags(), // optional flags for ISO 15693
  //       iso15693ExtendedMode: false // use extended mode for ISO 15693
  //       );
  // }

  // if (tag.type == NFCTagType.mifare_classic) {
  //   await FlutterNfcKit.authenticateSector(0, keyA: "FFFFFFFFFFFF");
  //   var data = await FlutterNfcKit.readSector(0); // read one sector, or
  //   // var data = await FlutterNfcKit.readBlock(0); // read one block
  // }

// Call finish() only once
  await FlutterNfcKit.finish();
  log("-------------- 7");
// iOS only: show alert/error message on finish
  // await FlutterNfcKit.finish(iosAlertMessage: "Success");
  log("-------------- 8");
// or
  // await FlutterNfcKit.finish(iosErrorMessage: "Failed");
}

Future<dynamic> nfcWrite222() async {
  var availability = await FlutterNfcKit.nfcAvailability;
  if (availability != NFCAvailability.available) {
    // oh-no
  }
  log("-------------- 0");

// timeout only works on Android, while the latter two messages are only for iOS
  var tag = await FlutterNfcKit.poll(
      timeout: Duration(seconds: 10),
      iosMultipleTagMessage: "Multiple tags found!",
      iosAlertMessage: "Scan your tag");

  log("-------------- 1");

  print(jsonEncode(tag));
  if (tag.type == NFCTagType.iso7816) {
    var result = await FlutterNfcKit.transceive("00B0950000",
        timeout: Duration(
            seconds:
                5)); // timeout is still Android-only, persist until next change
    print(result);
  }

  log("-------------- 2");

// iOS only: set alert message on-the-fly
// this will persist until finish()
  await FlutterNfcKit.setIosAlertMessage("hi there!");

  log("-------------- 3");

// read NDEF records if available
  // if (tag.ndefAvailable != null && tag.ndefAvailable!) {
  //   log("-------------- 4");

  //   /// decoded NDEF records (see [ndef.NDEFRecord] for details)
  //   /// `UriRecord: id=(empty) typeNameFormat=TypeNameFormat.nfcWellKnown type=U uri=https://github.com/nfcim/ndef`
  //   for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
  //     print(record.toString());
  //   }
  //   log("-------------- 5");

  //   /// raw NDEF records (data in hex string)
  //   /// `{identifier: "", payload: "00010203", type: "0001", typeNameFormat: "nfcWellKnown"}`
  //   for (var record in await FlutterNfcKit.readNDEFRawRecords(cached: false)) {
  //     print(jsonEncode(record).toString());
  //   }
  // }

  log("-------------- 6");

// write NDEF records if applicable
  if (tag.ndefWritable != null && tag.ndefWritable!) {
    // decoded NDEF records
    await FlutterNfcKit.writeNDEFRecords([
      ndef.UriRecord.fromUri(
          Uri(query: "https://github.com/nfcim/flutter_nfc_kit"))
    ]);
    // raw NDEF records
    await FlutterNfcKit.writeNDEFRawRecords([
      NDEFRawRecord(
          "00", "0001", "0002", ndef.TypeNameFormat.unknown)
    ]);
  }

// read / write block / page / sector level data
// see documentation for platform-specific supportability
  // if (tag.type == NFCTagType.iso15693) {
  //   await FlutterNfcKit.writeBlock(
  //       1, // index
  //       [0xde, 0xad, 0xbe, 0xff], // data
  //       iso15693Flags: Iso15693RequestFlags(), // optional flags for ISO 15693
  //       iso15693ExtendedMode: false // use extended mode for ISO 15693
  //       );
  // }

  // if (tag.type == NFCTagType.mifare_classic) {
  //   await FlutterNfcKit.authenticateSector(0, keyA: "FFFFFFFFFFFF");
  //   var data = await FlutterNfcKit.readSector(0); // read one sector, or
  //   // var data = await FlutterNfcKit.readBlock(0); // read one block
  // }

// Call finish() only once
  await FlutterNfcKit.finish();
  log("-------------- 7");
// iOS only: show alert/error message on finish
  // await FlutterNfcKit.finish(iosAlertMessage: "Success");
  log("-------------- 8");
// or
  // await FlutterNfcKit.finish(iosErrorMessage: "Failed");
}
