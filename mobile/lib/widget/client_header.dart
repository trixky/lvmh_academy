import 'package:flutter/material.dart';
import 'package:mobile/models/client.dart';
import 'package:mobile/widget/black_box.dart';

class ClientHeader extends StatelessWidget {
  const ClientHeader(
      {super.key, required this.client, required this.unFocusClient});

  final LVMHclient client;
  final void Function() unFocusClient;

  @override
  Widget build(BuildContext context) {
    const emptyStringReplacement = "-";
    const labelWidth = 100.0;
    const labelOpacity = 0.5;

    return BlackBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Client",
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
                    client.email ?? emptyStringReplacement,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
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
                client.phone ?? emptyStringReplacement,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
