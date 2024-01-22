import 'package:flutter/material.dart';
// import 'package:mobile/location_search_bar.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   foregroundColor: Colors.white,
        //   titleSpacing: 0,
        //   leading: IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //     },
        //   ),
        //   title: LocationSearchBar(
        //     setCity: _setCity,
        //     searchFocusNode: searchFocusNode,
        //   ),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: const Icon(Icons.near_me),
        //       onPressed: _setGeolocalisation,
        //     ),
        //   ],
        // ),
        body: const SafeArea(
          child: Center(
            child: Text(
              'Hello, world!',
            ),
          ),
        ),
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
              onPressed: () async {},
              heroTag: null,
              child: const Icon(Icons.add),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
}
