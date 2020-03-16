import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Providers/listing_provider.dart';

import '../Widgets/listing_item.dart';

class ListingListScreen extends StatelessWidget {
  // route
  static const routeName = '/listing-list';

  @override
  Widget build(BuildContext context) {
    // get registration provider
    final listingProvider = Provider.of<ListingProvider>(context);

    double height = MediaQuery.of(context).size.height;

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
              Expanded(
                child: SizedBox(
                  height: height,
                                  child: ListView.builder(
                    itemCount: listingProvider.itemCount,
                    itemBuilder: (ctx, i) => ListingItem(
                      listingProvider.listings[i].listingId,
                      listingProvider.listings[i].address.streetNumber,
                      listingProvider.listings[i].address.streetName,
                      listingProvider.listings[i].address.city,
                      listingProvider.listings[i].price,
                      listingProvider.listings[i].bed,
                      listingProvider.listings[i].bath,
                      listingProvider.listings[i].views,
                      listingProvider.listings[i].offers,
                      listingProvider.listings[i].photos[0].url,
                      listingProvider
                          .listings[i].listingDescription.descriptionHeader,
                          listingProvider.listings[i].isFavourite,
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

