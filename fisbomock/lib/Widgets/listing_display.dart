import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import '../Providers/listing_provider.dart';

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

    final Listing listing = listingProvider.findById(id);
    final Address address = listing.address;

    FlutterMoneyFormatter fmf =
        FlutterMoneyFormatter(amount: double.parse('${listing.price}'));

    double height = MediaQuery.of(context).size.height;

    return Container(

        child:  ListingImage(listing.listingId),

        
    );
  }
}
