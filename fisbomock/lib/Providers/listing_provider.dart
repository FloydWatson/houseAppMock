import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';

import '../Models/listingGet.dart';

class ListingProvider with ChangeNotifier {
  List<Listing> _listings = [];
  

  List<Listing> get listings {
    return [..._listings];
  }

  int get itemCount {
    return _listings == [] ? 0 : _listings.length;
  }

  Listing findById(String id) {
    return _listings.firstWhere((a) => a.listingId == id);
  }

  int photoCount(id) {
    Listing listing = findById(id);
    return listing.photos == [] ? 0 : listing.photos.length;
  }

  

  void setListings() {
    final res = json.encode({
    "listings-list": [
        {
            "listing-id": "123",
            "address": {
                "street-number": "123",
                "street-name": "Northcote St",
                "suburb": "Frimley",
                "city": "Hastings",
                "region": "Hawkes Bay",
                "country": "New Zealand"
        
            },
            "price": 450000,
            "bed": 4,
            "bath": 2,
            "lounge": 1,
            "dining": 1,
            "study": 1,
            "garage-parking": 2,
            "off-site-parking": 4,
            "views": 55,
            "offers": 2,
            "photos": [
                {
                    "photo-id": "123photo1",
                    "url": "assets/123NorthcoteSt.jpg"
                },
                {
                    "photo-id": "123photo2",
                    "url": "assets/Kitchen.jpg"
                },
                {
                    "photo-id": "123photo3",
                    "url": "assets/Bathroom.jpg"
                }
            ],
            "listing-description": {
                "listing-description-id": "123description",
                "description-header": "Entry-Level Lifestyle",
                "description-body": "Step into a North Canterbury rural location, with this 2ha lifestyle property with 7 x paddocks - allowing manageable land at your disposal and situated only minutes away from the heart of Rangiora township.The home is set within flourishing private grounds, surrounded by easy-care establishment and shelter-belts. The home is comfortable for modern-day living, with good sized kitchen / dining / lounge and bedrooms, - and with plenty of opportunity",
                "features": [
                    {
                        "feature-id": "123feature",
                        "feature-header": "Land Size",
                        "feature-body": "800 m2"
                    }
                ],
                "chattels": [
                    {
                        "chattel-id": "123chattel",
                        "chattel-header": "Kitchen",
                        "chattel-body": "Dish Washer, Fridge"
                    }
                ]      
            }
        },
        {
            "listing-id": "456",
            "address": {
                "street-number": "456",
                "street-name": "Northcote St",
                "suburb": "Frimley",
                "city": "Hastings",
                "region": "Hawkes Bay",
                "country": "New Zealand"
        
            },
            "price": 500000,
            "bed": 5,
            "bath": 3,
            "lounge": 2,
            "dining": 1,
            "study": 2,
            "garage-parking": 2,
            "off-site-parking": 3,
            "views": 25,
            "offers": 1,
            "photos": [
                {
                    "photo-id": "456photo",
                    "url": "assets/456NorthcoteSt.jpg"
                }
            ],
            "listing-description": {
                "listing-description-id": "456description",
                "description-header": "Sun-sational in Maungaraki",
                "description-body": "This fabulous innovative three bedroom, two bathroom 2010 build home is perfectly sited for you to enjoy sun, privacy and the peace and quiet of Otonga Heights. Here is a home to tick all the boxes for contemporary living: open plan living with wonderful indoor/outdoor flow to sunny decks and gardens, stylish well appointed kitchen, spacious bathrooms, full insulation and double glazing throughout, family sized heat pump for Winter coziness. Large double garage with auto door plus off-street parking for two completes the picture.",
                "features": [
                    {
                        "feature-id": "456feature",
                        "feature-header": "Land Size",
                        "feature-body": "800 m2"
                    }
                ],
                "chattels": [
                    {
                        "chattel-id": "456chattel",
                        "chattel-header": "Kitchen",
                        "chattel-body": "Dish Washer, Fridge"
                    }
                ]      
            }
        },
        {
            "listing-id": "502",
            "address": {
                "street-number": "502",
                "street-name": "Grove Rd",
                "suburb": "Mayfair",
                "city": "Hastings",
                "region": "Hawkes Bay",
                "country": "New Zealand"
        
            },
            "price": 380000,
            "bed": 3,
            "bath": 1,
            "lounge": 1,
            "dining": 1,
            "study": 0,
            "garage-parking": 1,
            "off-site-parking": 0,
            "views": 75,
            "offers": 0,
            "photos": [
                {
                    "photo-id": "502photo",
                    "url": "assets/502GroveRd.jpg"
                }
            ],
            "listing-description": {
                "listing-description-id": "502description",
                "description-header": "Investment Property",
                "description-body": "Tidy 4 Bedroom home that has undergone a basic update and redecoration Palaside exterior with mostly wooden joinery with multifuel heating , some repiling work consented. Mawhera Leasehold that could possibly be made freehold on application to Mawhera. This property is being sold as where is with No vendor warranties and currently does not meet the requirements of the Residential Tenancy Act.",
                "features": [
                    {
                        "feature-id": "502feature",
                        "feature-header": "Land Size",
                        "feature-body": "800 m2"
                    }
                ],
                "chattels": [
                    {
                        "chattel-id": "502chattel",
                        "chattel-header": "Kitchen",
                        "chattel-body": "Dish Washer, Fridge"
                    }
                ]      
            }
        }
    ]
}
    

);

    Listings listings = Listings.fromJson(json.decode(res));

    log('Listings: ${listings.listingsList}');

    _listings = [...listings.listingsList];

    log('Listings: ${_listings}');

    log('Lising id: ${_listings[0].listingId}');

  }
}
