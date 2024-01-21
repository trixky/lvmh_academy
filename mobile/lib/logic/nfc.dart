// import 'dart:developer';
// import 'dart:typed_data';

// import 'package:credit_card_scanner/credit_card_scanner.dart';
// import 'package:flutter/material.dart';
// import 'package:nfc_manager/nfc_manager.dart';

// Future<Map<String, dynamic>> nfcRead() async {
//   final nfcIsAvailable = await NfcManager.instance.isAvailable();
//   if (!nfcIsAvailable) {
//     throw Exception('NFC is not available');
//   }

//   ValueNotifier<dynamic> result = ValueNotifier(null);

//   await NfcManager.instance.startSession(
//     // invalidateAfterFirstRead: true,
//     alertMessage: "oyosdifsd iiii",
//     onDiscovered: (NfcTag tag) async {
//       log("BON !!! ???");
//       log(tag.toString());
//       // log(jsonEncode(tag));
//       result.value = tag.data;

//       log('AVANT TOUT ::::::');
//       final toto = tag.data;
//       for (var i = 0; i < toto.length; i++) {
//         log(':::::: --- apres');
//         log(toto[i].toString());
//       }

//       final ndef = Ndef.from(tag);

//       if (ndef == null) {
//         log("ERROR 1 ???");
//         await NfcManager.instance
//             .stopSession(errorMessage: result.value.toString());
//         throw Exception('Tag is not ndef');
//       }

//       if (ndef.cachedMessage == null) {
//         log("ERROR 2 ???");
//         await NfcManager.instance
//             .stopSession(errorMessage: result.value.toString());
//         throw Exception('No cached message records found!');
//       }

//       if (ndef.cachedMessage!.records.isEmpty) {
//         log("ERROR 3 ???");
//         await NfcManager.instance
//             .stopSession(errorMessage: result.value.toString());
//         throw Exception('No NDEF records found!');
//       }

//       // final record = ndef.cachedMessage!.records.first;
//       // final decodedPayload = ascii.decode(record.payload);

//       final message = await ndef.read();

//       log("========================= ELEMENTS");
//       message!.records.forEach((element) {
//         log("---------------------------- element");
//         log(element.toString());
//         log(element.payload.toString());
//         log(element.identifier.toString());
//       });

//       // log("du CUOP !!!!");
//       // log(decodedPayload);

//       // result.value = decodedPayload;

//       NfcManager.instance.stopSession();
//     },
//     onError: (error) {
//       log("ERROR 2 ???");
//       log(error.toString());
//       result.value = error;
//       return NfcManager.instance
//           .stopSession(errorMessage: result.value.toString());
//     },
//   );
//   log("ououoouou 2 ???");

//   if (result.value == null) {
//     throw Exception('Nothing to read');
//   }

//   return result.value;
// }

// Future<dynamic> nfcWrite() async {
//   final nfcIsAvailable = await NfcManager.instance.isAvailable();
//   if (!nfcIsAvailable) {
//     throw Exception('NFC is not available');
//   }

//   ValueNotifier<dynamic> result = ValueNotifier(null);

//   NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
//     var ndef = Ndef.from(tag);
//     if (ndef == null || !ndef.isWritable) {
//       await NfcManager.instance.stopSession(errorMessage: result.value);
//       throw Exception('Tag is not ndef writable');
//     }

//     NdefMessage message = NdefMessage([
//       NdefRecord.createText('Hello World!'),
//       NdefRecord.createUri(Uri.parse('https://flutter.dev')),
//       NdefRecord.createMime(
//           'text/plain', Uint8List.fromList('Hello'.codeUnits)),
//       NdefRecord.createExternal(
//           'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
//     ]);

//     try {
//       await ndef.write(message);
//       await NfcManager.instance.stopSession();
//     } catch (e) {
//       await NfcManager.instance.stopSession(errorMessage: e.toString());
//       throw Exception('Failed to write:$e');
//     }
//   });
// }

// // void writeLock() {
// //   ValueNotifier<dynamic> result = ValueNotifier(null);

// //   NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
// //     var ndef = Ndef.from(tag);
// //     if (ndef == null) {
// //       result.value = 'Tag is not ndef';
// //       NfcManager.instance.stopSession(errorMessage: result.value.toString());
// //       return;
// //     }

// //     try {
// //       await ndef.writeLock();
// //       result.value = 'Success to "Ndef Write Lock"';
// //       NfcManager.instance.stopSession();
// //     } catch (e) {
// //       result.value = e;
// //       NfcManager.instance.stopSession(errorMessage: result.value.toString());
// //       return;
// //     }
// //   });
// // }

// Future<void> scanCard() async {
//   CardScanOptions scanOptions = const CardScanOptions(
//     scanCardHolderName: true,
//     // enableDebugLogs: true,
//     validCardsToScanBeforeFinishingScan: 5,
//     possibleCardHolderNamePositions: [
//       CardHolderNameScanPosition.aboveCardNumber,
//     ],
//   );

//     final CardDetails? cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    
//     log(cardDetails.toString());
//   }