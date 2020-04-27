import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/listing_provider.dart';
import '../Providers/user_provider.dart';

import '../Screens/favourites_screen.dart';

import '../Widgets/user_listing_item.dart';

import 'package:google_fonts/google_fonts.dart';

class MyPropertiesScreen extends StatelessWidget {
  static const routeName = '/my_properties';
  @override
  Widget build(BuildContext context) {
    final listingProvider = Provider.of<ListingProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
              icon: Icon(Icons.star),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed(FavouritesScreen.routeName);
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
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                listingProvider.setListings();
                userProvider.setUser();
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
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'My Properties',
                style: GoogleFonts.lato(
                  // posible heading style. will move to theme
                  textStyle: TextStyle(
                    letterSpacing: .25,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  width: width,
                  child: ListView.builder(
                    itemCount: listingProvider.itemCount,
                    itemBuilder: (ctx, i) => UserListingItem(
                      listingProvider.listings[i].listingId,
                      listingProvider.listings[i].address.streetNumber,
                      listingProvider.listings[i].address.streetName,
                      listingProvider.listings[i].address.city,
                      listingProvider.listings[i].price,
                      listingProvider.listings[i].views,
                      listingProvider.listings[i].offers,
                      listingProvider.listings[i].photos[0].url,
                      listingProvider
                          .listings[i].listingDescription.descriptionHeader,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
