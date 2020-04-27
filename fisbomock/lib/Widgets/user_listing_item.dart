import 'dart:developer';

import 'package:fisbomock/Providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import '../Widgets/listing_screen_arguments.dart';
import '../Screens/listing_screen.dart';

import '../Providers/listing_provider.dart';
import '../Models/listingGet.dart';

class UserListingItem extends StatelessWidget {
  final String id;
  final String streetNumber;
  final String streetName;
  final String city;
  final int price;
  final int views;
  final int offers;
  final String imagePath;
  final String heading;

  UserListingItem(
    this.id,
    this.streetNumber,
    this.streetName,
    this.city,
    this.price,
    this.views,
    this.offers,
    this.imagePath,
    this.heading,
  );

  @override
  Widget build(BuildContext context) {
    final listingProvider = Provider.of<ListingProvider>(context);
    double width = MediaQuery.of(context).size.width;
    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: double.parse('$price'));
    return GestureDetector(
      onTap: () {
        log('TAP');
        listingProvider.setActivePhoto(id);
        Navigator.of(context).pushNamed(ListingScreen.routeName,
            arguments: ListingScreenArguments(id));
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: SizedBox(
            width: width,
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FittedBox(
                      child: Image.asset(
                        '$imagePath',
                        width: 100,
                        height: 100,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Text(
                              '$heading',
                              style: GoogleFonts.lato(
                                // posible heading style. will move to theme
                                textStyle: TextStyle(
                                  letterSpacing: .25,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Text(
                              '$streetNumber' +
                                  ' ' +
                                  '$streetName' +
                                  ' ' +
                                  '$city',
                              style: GoogleFonts.lato(
                                // posible heading style. will move to theme
                                textStyle: TextStyle(
                                  letterSpacing: .25,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Row(children: <Widget>[
                              Text(
                                'Price: ' + '${fmf.output.symbolOnLeft}',
                                style: GoogleFonts.lato(
                                  // posible heading style. will move to theme
                                  textStyle: TextStyle(
                                    letterSpacing: .25,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.binoculars,
                                color: Colors.black,
                                size: 12,
                              ),
                              Text(
                                ' $views',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.tags,
                                color: Colors.black,
                                size: 12,
                              ),
                              Text(
                                ' $offers',
                                style: TextStyle(fontSize: 12),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
