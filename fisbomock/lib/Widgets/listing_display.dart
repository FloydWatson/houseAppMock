import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import '../Providers/listing_provider.dart';
import '../Providers/user_provider.dart';

import '../Models/listingGet.dart';

import './listing_image.dart';

class ListingDisplay extends StatelessWidget {
  final String id;

  ListingDisplay(
    this.id,
  );

  @override
  Widget build(BuildContext context) {
    final listingProvider = Provider.of<ListingProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    final Listing listing = listingProvider.findById(id);
    final Address address = listing.address;

    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: double.parse('${listing.price}'));

    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              ListingImage(listing.listingId),
              SizedBox(height: 2),
              Row(
                
                children: <Widget>[
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.binoculars,
                    color: Colors.black,
                    size: 16,
                  ),
                  Text(
                    ' ${listing.views}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.tags,
                    color: Colors.black,
                    size: 16,
                  ),
                  Text(
                    ' ${listing.offers}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Spacer(),
                  IconButton(
                    icon: FaIcon(userProvider.seeIfFav(1, listing)
                        ? FontAwesomeIcons.solidStar
                        : FontAwesomeIcons.star),
                    onPressed: () {
                      listingProvider.updateFavourite(id);
                    },
                    color: Colors.yellow,
                  ),
                ],
                //child:
              ),
              Divider(),
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${listing.listingDescription.descriptionHeader}',
                        style: GoogleFonts.lato(
                          // posible heading style. will move to theme
                          textStyle: TextStyle(
                            letterSpacing: .25,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w600
                        //  ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          '${address.streetNumber} ${address.streetName} ${address.city}'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${fmf.output.symbolOnLeft}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              '${listing.listingDescription.descriptionBody}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    // -------------------------------------------------------------------------------------------------
                    // We will need a builder here that builds the icons dependeing on what the listing has
                    // maybe add a small text of what it means underneath to
                    // --------------------------------------------------------------------------------------------------
                    children: <Widget>[
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(12, 82, 148, 0.2)),
                            color: Color.fromRGBO(12, 82, 148, 0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.bed),
                            Text(
                              ' ${listing.bed}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(12, 82, 148, 0.2)),
                            color: Color.fromRGBO(12, 82, 148, 0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.bath),
                            Text(
                              ' ${listing.bath}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(12, 82, 148, 0.2)),
                            color: Color.fromRGBO(12, 82, 148, 0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.couch),
                            Text(
                              ' ${listing.lounge}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(12, 82, 148, 0.2)),
                            color: Color.fromRGBO(12, 82, 148, 0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.car),
                            Text(
                              ' ${listing.garageParking}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(12, 82, 148, 0.2)),
                            color: Color.fromRGBO(12, 82, 148, 0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.laptop),
                            Text(
                              ' ${listing.study}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ],
          )
          //child:
          ),
    );
  }
}
