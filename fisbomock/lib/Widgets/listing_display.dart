import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import '../Providers/listing_provider.dart';

import '../Models/listingGet.dart';


class ListingDisplay extends StatelessWidget {



  final String id;


  ListingDisplay(
      this.id,
);

  @override
  Widget build(BuildContext context) {
    final listingProvider = Provider.of<ListingProvider>(context);

    final Listing listing = listingProvider.findById(id);
    final Address address = listing.address;

    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: double.parse('${listing.price}'));
    return SingleChildScrollView(
     
          child: Column(
            children: <Widget>[
         Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  FittedBox(
                    child: Image.asset('${listing.photos[0].url}'),
                    fit: BoxFit.fill,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(36, 119, 255, 0.6)),
                                  color: Color.fromRGBO(36, 119, 255, 0.6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Row(
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.binoculars,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  Text(
                                    ' ${listing.views}',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(36, 119, 255, 0.6)),
                                  color: Color.fromRGBO(36, 119, 255, 0.6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Row(
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.tags,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  Text(
                                    ' ${listing.offers}',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'TEST',
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
                        padding: const EdgeInsets.all(2.0),
                        child: Text('${address.streetNumber} ${address.streetName} ${address.city}'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
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
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      
                      children: <Widget>[
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
                        Spacer(),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.star),
                          onPressed: () {},
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
            ],
      ),
    );
  }
}

