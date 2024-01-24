import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/clients.dart';
import 'package:mobile/widget/client_header.dart';
import 'package:mobile/widget/search_bar.dart';
import 'package:mobile/models/client.dart';
import 'package:mobile/widget/multistep_form.dart';
// import 'package:mobile/location_search_bar.dart';

class Screen extends StatefulWidget {
  Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<LVMHclient> clients = [...defaultClients];
  LVMHclient? focusedClient;
  FocusNode searchFocusNode = FocusNode();

  void _addClient(LVMHclient client) {
    setState(() {
      clients.add(client);
    });
  }

  void _focusClient(LVMHclient client) {
    setState(() {
      focusedClient = client;
    });
  }

  void _focusClientRandom() {
    setState(() {
      focusedClient = clients[clients.length - 1];
    });
  }

  void _unfocusClient() {
    setState(() {
      focusedClient = null;
    });
  }

  void _navigateToMultiStepForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              MultiStepForm(addClient: _addClient, focusClient: _focusClient)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body = const SafeArea(
      child: Center(
        child: Text(
          'Aucun client sélectionné',
        ),
      ),
    );

    if (focusedClient != null) {
      body = ClientHeader(
        client: focusedClient!,
        unFocusClient: _unfocusClient,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: ClientSearchBar(
          clients: clients,
          focusClient: _focusClient,
          unFocusClient: _unfocusClient,
          searchFocusNode: searchFocusNode,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: body,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () async {
                var result = await BarcodeScanner.scan();
                _focusClientRandom();

                // log(result.type
                //     .toString()); // The result type (barcode, cancelled, failed)
                // log(result.rawContent); // The barcode content
                // log(result.format.toString()); // The barcode format (as enum)
                // log(result
                //     .formatNote); // If a unknown format was scanned this field contains a note
              },
              heroTag: null,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: const Icon(Icons.qr_code_scanner),
            ),
            const SizedBox(
              width: 40,
            ),
            FloatingActionButton(
              onPressed: () async {
                _navigateToMultiStepForm(context);
              },
              heroTag: null,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
