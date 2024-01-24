import 'package:flutter/material.dart';
import 'package:mobile/models/client.dart';
import 'package:mobile/widget/black_box.dart';
import 'package:mobile/widget/qr_code_generator.dart';

class ClientHeader extends StatelessWidget {
  const ClientHeader(
      {super.key, required this.client, required this.unFocusClient});

  final LVMHclient client;
  final void Function() unFocusClient;

  void _handleQrcode(BuildContext context, LVMHclient client) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ajouter mon LV-pass'),
          content: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 200,
              child: QRcodeGenerator(url: client.passUrl),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child:
                  const Text('Fermer', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _handleModification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modification'),
          content: const Text("Non implementé"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child:
                  const Text('Fermer', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const emptyStringReplacement = "-";
    const labelWidth = 100.0;
    const labelOpacity = 0.5;

    final bottomButtonStyle = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            side: const BorderSide(
                width: 1, // thickness
                color: Colors.black // color
                ),
            // border radius
            borderRadius: BorderRadius.circular(14)),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white);

    return Column(
      children: [
        BlackBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Fiche Client",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  GestureDetector(
                    onTap: unFocusClient,
                    child: const Icon(Icons.close, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(
                    width: labelWidth,
                    child: Opacity(
                      opacity: labelOpacity,
                      child: Text(
                        "Prénom",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Text(
                    client.firstname,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: labelWidth,
                    child: Opacity(
                      opacity: labelOpacity,
                      child: Text(
                        "Nom",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Text(
                    client.lastname,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: labelWidth,
                    child: Opacity(
                      opacity: labelOpacity,
                      child: Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        (client.email == null || client.email!.isEmpty)
                            ? emptyStringReplacement
                            : client.email!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: labelWidth,
                    child: Opacity(
                      opacity: labelOpacity,
                      child: Text(
                        "Téléphone",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Text(
                    (client.phone == null || client.phone!.isEmpty)
                        ? emptyStringReplacement
                        : client.phone!,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  _handleQrcode(context, client);
                },
                style: bottomButtonStyle,
                icon: Icon(Icons.qr_code),
                label: const Text("QR Code"),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  _handleModification(context);
                },
                style: bottomButtonStyle,
                icon: Icon(Icons.edit),
                label: const Text("Modifier"),
              ),
            ),
          ],
        )
      ],
    );
  }
}
