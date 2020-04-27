import 'package:fisbomock/Screens/add_property_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/listing_provider.dart';
import '../Providers/user_provider.dart';

import '../Screens/favourites_screen.dart';

import '../Widgets/user_listing_item.dart';

import 'package:google_fonts/google_fonts.dart';

import '../Models/listingGet.dart';

class MyPropertiesScreen extends StatelessWidget {
  static const routeName = '/my_properties';
  int user = 1;
  @override
  Widget build(BuildContext context) {
    final listingProvider = Provider.of<ListingProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<Listing> userlist = listingProvider.getUserListings(user);

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
          child: Stack(
                      children:<Widget>[ Column(
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
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: ListView.builder(
                      itemCount: userlist.length,
                      itemBuilder: (ctx, i) => UserListingItem(
                        userlist[i].listingId,
                        userlist[i].address.streetNumber,
                        userlist[i].address.streetName,
                        userlist[i].address.city,
                        userlist[i].price,
                        userlist[i].views,
                        userlist[i].offers,
                        userlist[i].photos[0].url,
                        userlist[i].listingDescription.descriptionHeader,
                      ),
                    ),
                  ),
                ),
                
                
              ],
              
            ),
            Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 30, top: 10, bottom: 10),
                      child: IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                            size: 62,
                          ),
                          onPressed: () {
                            //add a new property
                            Navigator.of(context).pushNamed(AddPropertyScreen.routeName);
                          }),
                    ))
                      ],
          ),
                      
        ),
      ),
    );
  }
}
