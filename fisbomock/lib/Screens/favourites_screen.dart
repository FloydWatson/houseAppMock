import 'package:fisbomock/Providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/listing_provider.dart';
import '../Providers/user_provider.dart';

import '../Models/listingGet.dart';

import '../Widgets/listing_item.dart';

class FavouritesScreen extends StatelessWidget {
  // route
  static const routeName = '/favourites';

  @override
  Widget build(BuildContext context) {
    // get registration provider
    final listingProvider = Provider.of<ListingProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    double height = MediaQuery.of(context).size.height;
    List<Listing> favs = userProvider.getUserFavourites(1);

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
      body: favs.isEmpty
          ? Center(
              child: Text('You have no favourites yet, start adding some!'),
            )
          : Center(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Favourites", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, ),),
                    ),
                    
                    Divider(),
                    Expanded(
                      child: SizedBox(
                        height: height,
                        child: ListView.builder(
                          itemCount: userProvider.userFavouritesItemCount(1),
                          itemBuilder: (ctx, i) => ListingItem(
                            favs[i].listingId,
                            favs[i].address.streetNumber,
                            favs[i].address.streetName,
                            favs[i].address.city,
                            favs[i].price,
                            favs[i].bed,
                            favs[i].bath,
                            favs[i].views,
                            favs[i].offers,
                            favs[i].photos[0].url,
                            favs[i].listingDescription.descriptionHeader,
                            // clear this ---------------------------------------------------------------------
                            true
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
