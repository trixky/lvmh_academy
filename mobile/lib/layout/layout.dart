import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
import 'package:flutter/material.dart';
import 'package:lvmh_academy/logic/nfc.dart';
import 'package:lvmh_academy/logic/nfc2.dart';
import 'package:uuid/uuid.dart';

class GlobalLayout extends StatelessWidget {
  GlobalLayout({super.key});

final String _passId = const Uuid().v4();
final String _passClass = 'example';
final String _issuerId = '3333000000000000000';
final String _issuerEmail = 'example@example.com';

      // "iss": "$_issuerEmail",
            // "id": "$_issuerId.$_passId",
            // "classId": "$_issuerId.$_passClass",
              // "value": "$_passId"
final String _examplePass = """ 
    {
      "iss": "example@example.com",
      "aud": "google",
      "typ": "savetowallet",
      "origins": [],
      "payload": {
        "genericObjects": [
          {
            "id": "3333000000000000000.1d844280-c883-4e7e-8f9b-f87f7e28c60c",
            "classId": "2432434234234",
            "genericType": "GENERIC_TYPE_UNSPECIFIED",
            "hexBackgroundColor": "#4285f4",
            "logo": {
              "sourceUri": {
                "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/pass_google_logo.jpg"
              }
            },
            "cardTitle": {
              "defaultValue": {
                "language": "en",
                "value": "Google I/O '22 [DEMO ONLY]"
              }
            },
            "subheader": {
              "defaultValue": {
                "language": "en",
                "value": "Attendee"
              }
            },
            "header": {
              "defaultValue": {
                "language": "en",
                "value": "Alex McJacobs"
              }
            },
            "barcode": {
              "type": "QR_CODE",
              "value": "33333fsdfsdfsdfsdf"
            },
            "heroImage": {
              "sourceUri": {
                "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/google-io-hero-demo-only.jpg"
              }
            },
            "textModulesData": [
              {
                "header": "POINTS",
                "body": "1234",
                "id": "points"
              }
            ]
          }
        ]
      }
    }
""";

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
            child: Center(
          child: Text(
            'Hello, world!',
          ),
        )),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(Icons.credit_card),
        // ),
        floatingActionButton:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          // FloatingActionButton(
          //   onPressed: () async {
          //     try {
          //       ScaffoldMessenger.of(context).clearSnackBars();
          //       var value = await nfcRead();
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         content: Text("read success:$value"),
          //       ));
          //     } catch (e) {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         content: Text("read failed!$e"),
          //       ));
          //     }
          //   },
          //   heroTag: null,
          //   child: Icon(Icons.remove_red_eye),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // FloatingActionButton(
          //   onPressed: () async {
          //     ScaffoldMessenger.of(context).clearSnackBars();
          //     try {
          //       await nfcWrite();
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         content: Text("write success!"),
          //       ));
          //     } catch (e) {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         content: Text("write failed!$e"),
          //       ));
          //     }
          //   },
          //   heroTag: null,
          //   child: Icon(Icons.add),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          FloatingActionButton(
            onPressed: () async {
              nfcRead222();
            },
            heroTag: null,
            child: Icon(Icons.credit_card),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () async {
              nfcWrite222();
            },
            heroTag: null,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 20,),
          AddToGoogleWalletButton(
            pass: _examplePass,
            onSuccess:() => print('Success!'),
            onCanceled: () => print('Action canceled.'),
            onError: (Object error) => print(error.toString()),
            // onSuccess: () => _showSnackBar(context, 'Success!'),
            // onCanceled: () => _showSnackBar(context, 'Action canceled.'),
            // onError: (Object error) => _showSnackBar(context, error.toString()),
            locale: const Locale.fromSubtags(
              languageCode: 'fr',
              countryCode: 'FR',
            ),
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
}
