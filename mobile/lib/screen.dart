import 'dart:developer';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/clients.dart';
import 'package:mobile/widget/client_header.dart';
import 'package:mobile/widget/client_stats.dart';
import 'package:mobile/widget/search_bar.dart';
import 'package:mobile/models/client.dart';
import 'package:mobile/widget/multistep_form.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

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
      body = SingleChildScrollView(
        child: Column(
          children: [
            ClientHeader(
              client: focusedClient!,
              unFocusClient: _unfocusClient,
            ),
            const SizedBox(height: 10),
            ClientStats(client: focusedClient!),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 50,
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            log("ouissff");
            if (searchFocusNode.hasFocus) {
              searchFocusNode.unfocus();
            } else {
              searchFocusNode.requestFocus();
              // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
              searchFocusNode.notifyListeners();
            }
          },
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: ClientSearchBar(
            clients: clients,
            focusClient: _focusClient,
            unFocusClient: _unfocusClient,
            searchFocusNode: searchFocusNode,
          ),
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
                // ---------------------------------------- // BULLSHIT
                final result = await BarcodeScanner.scan(); // BULLSHIT
                // ---------------------------------------- // BULLSHIT
                _focusClientRandom();
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
