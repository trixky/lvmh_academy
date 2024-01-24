import 'package:flutter/material.dart';
import 'package:mobile/models/client.dart';
import 'package:mobile/widget/black_box.dart';

const hiddenStatsReplacement = "*****";

class ClientStats extends StatefulWidget {
  const ClientStats({super.key, required this.client});

  final LVMHclient client;

  @override
  State<ClientStats> createState() => _ClientStatsState();
}

class _ClientStatsState extends State<ClientStats> {
  void _handlePurchaseHistory(BuildContext context) {
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

  void _handleDetails(BuildContext context) {
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

  var statsHidden = true;

  void handleStatVisibility() {
    setState(() {
      statsHidden = !statsHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    const emptyStringReplacement = "-";
    const labelWidth = 160.0;
    const labelOpacity = 0.6;

    final clientStats = widget.client.stats != null
        ? (widget.client.stats!.purchases.isEmpty ? null : widget.client.stats!)
        : null;

    final bottomButtonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          side: const BorderSide(
              width: 1, // thickness
              color: Colors.black // color
              ),
          // border radius
          borderRadius: BorderRadius.circular(14)),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    );

    String formatAmount(double amount, {String unit = "€"}) {
      return "${amount.toStringAsFixed(2)} $unit";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlackBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.bar_chart, color: Colors.white),
                  const SizedBox(width: 10),
                  const Text(
                    "Statistiques Client",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: handleStatVisibility,
                      child: Icon(
                          statsHidden
                              ? Icons.visibility_off
                              : Icons.remove_red_eye,
                          color: Colors.white))
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
                        "Dépenses totales",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    statsHidden
                        ? hiddenStatsReplacement
                        : clientStats == null
                            ? emptyStringReplacement
                            : formatAmount(clientStats.totalExpenses),
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
                        "Panier moyen",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    statsHidden
                        ? hiddenStatsReplacement
                        : clientStats == null
                            ? emptyStringReplacement
                            : formatAmount(clientStats.averageExpenses),
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
                        "Panier max",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    statsHidden
                        ? hiddenStatsReplacement
                        : clientStats == null
                            ? emptyStringReplacement
                            : formatAmount(clientStats.maxExpenses),
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
                        "Panier min",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    statsHidden
                        ? hiddenStatsReplacement
                        : clientStats == null
                            ? emptyStringReplacement
                            : formatAmount(clientStats.minExpenses),
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
                  _handlePurchaseHistory(context);
                },
                style: bottomButtonStyle,
                icon: const Icon(Icons.list),
                label: const Text("Historique"),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  _handleDetails(context);
                },
                style: bottomButtonStyle,
                icon: const Icon(Icons.info_outlined),
                label: const Text("Plus"),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton.icon(
          onPressed: () {
            _handlePurchaseHistory(context);
          },
          style: bottomButtonStyle,
          icon: const Icon(Icons.zoom_in),
          label: const Text("Détails du dernier achat"),
        ),
      ],
    );
  }
}
