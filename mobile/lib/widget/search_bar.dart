// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile/data/clients.dart';
import 'package:mobile/models/client.dart';

class ClientSearchBar extends StatefulWidget {
  const ClientSearchBar(
      {super.key,
      required this.clients,
      required this.focusClient,
      required this.unFocusClient,
      required this.searchFocusNode});

  final List<LVMHclient> clients;
  final void Function(LVMHclient client) focusClient;
  final void Function() unFocusClient;
  final FocusNode searchFocusNode;

  @override
  State<ClientSearchBar> createState() => _ClientSearchBarState();
}

class _ClientSearchBarState extends State<ClientSearchBar> {
  TextEditingController? currentTextEditingController;
  FocusNode? currentFocusNode;

  String displayStringForOption(LVMHclient client) =>
      "${client.firstname} | ${client.lastname}";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Autocomplete<LVMHclient>(
        displayStringForOption: displayStringForOption,
        fieldViewBuilder: (
          BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted,
        ) {
          currentTextEditingController = textEditingController;
          currentFocusNode = focusNode;

          widget.searchFocusNode.addListener(() {
            if (focusNode.hasFocus) {
              focusNode.unfocus();
            } else {
              focusNode.requestFocus();
            }
          });

          return TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: 'Chercher un client',
              labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            ),
            cursorColor: Colors.white,
            style: const TextStyle(
              color: Colors.white,
              decorationColor: Colors.white,
            ),
            controller: textEditingController,
            focusNode: focusNode,
            onFieldSubmitted: (String value) {
              onFieldSubmitted();
            },
          );
        },
        optionsBuilder: (TextEditingValue textEditingValue) async {
          if (textEditingValue.text == '') {
            return const Iterable<LVMHclient>.empty();
          }

          try {
            final cities = await searchClient(
                widget.clients, textEditingValue.text,
                limit: 5);
            return cities;
          } catch (error) {
            var snackBar = const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Failed to get cities, check your connection.'),
              duration: Duration(seconds: 5),
              // put at the top
              behavior: SnackBarBehavior.floating,
            );

            ScaffoldMessenger.of(context).clearSnackBars();
            Future.delayed(const Duration(seconds: 1)).then(((value) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              currentFocusNode!.unfocus();
            }));
            return [];
          }
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth,
                  ),
                  child: Container(
                    color: Colors.black,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final LVMHclient option = options.elementAt(index);
                        return InkWell(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Builder(
                            builder: (BuildContext context) {
                              final bool highlight =
                                  AutocompleteHighlightedOption.of(context) ==
                                      index;
                              if (highlight) {
                                SchedulerBinding.instance
                                    .addPostFrameCallback((Duration timeStamp) {
                                  Scrollable.ensureVisible(context,
                                      alignment: 0.5);
                                });
                              }
                              return Container(
                                color: highlight
                                    ? Theme.of(context).focusColor
                                    : null,
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  displayStringForOption(option),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        onSelected: (LVMHclient selectedClient) {
          widget.focusClient(selectedClient);
          if (currentFocusNode != null) {
            currentFocusNode!.unfocus();
          }
          if (currentTextEditingController != null) {
            currentTextEditingController!.clear();
          }
        },
      ),
    );
  }
}
