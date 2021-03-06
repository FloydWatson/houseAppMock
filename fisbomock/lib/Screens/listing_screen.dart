import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Providers/listing_provider.dart';

import '../Widgets/listing_screen_arguments.dart';
import '../Widgets/listing_display.dart';

class ListingScreen extends StatelessWidget {
  // route
  static const routeName = '/listing';

  @override
  Widget build(BuildContext context) {
    // get registration provider
    final listingProvider = Provider.of<ListingProvider>(context);

    final ListingScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/fisboLogo.jpg',
          fit: BoxFit.fitWidth,
          scale: 3,
        ),
        actions: <Widget>[
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                listingProvider.setListings();
              },
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.person_outline),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 30),
            child: ListingDisplay(args.id)),
      ),
    );
  }
}
