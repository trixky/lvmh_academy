import 'package:flutter/material.dart';
import 'package:mobile/data/clients.dart';
import 'package:mobile/widget/client_header.dart';
import 'package:mobile/widget/search_bar.dart';
import 'package:mobile/models/client.dart';
import 'package:mobile/multistep_form.dart';
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

  void _unfocusClient() {
    setState(() {
      focusedClient = null;
    });
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
      body: body,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () async {},
            heroTag: null,
            child: const Icon(Icons.credit_card),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () async {
              _navigateToMultiStepForm(context);
            },
            heroTag: null,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void _navigateToMultiStepForm(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MultiStepForm()),
  );
}
