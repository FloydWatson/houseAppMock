import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';
import '../Providers/listing_provider.dart';

import './listing_list_screen.dart';

class HomeScreen extends StatelessWidget {
  // route
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    // get registration provider
    final listingProvider = Provider.of<ListingProvider>(context);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  listingProvider.setListings();
                  Navigator.of(context).pushNamed(ListingListScreen.routeName);
                },
                padding: const EdgeInsets.all(8.0),
                textColor: Theme.of(context).primaryTextTheme.button.color,
                color: Theme.of(context).buttonColor,
                child: Text(
                  'Listings',
                  style: GoogleFonts.lato(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
