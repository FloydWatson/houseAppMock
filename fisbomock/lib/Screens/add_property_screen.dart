import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/listing_provider.dart';
import '../Providers/user_provider.dart';

import '../Screens/favourites_screen.dart';

import '../Models/listingGet.dart';

import 'package:google_fonts/google_fonts.dart';

class AddPropertyScreen extends StatelessWidget {
  static const routeName = '/add_property';
  final _form = GlobalKey<FormState>();
  final _streetNumberFocusNode = FocusNode();
  final _streetNameFocusNode = FocusNode();
  final _suburbFocusNode = FocusNode();
  final _cityFocusNode = FocusNode();
  final _regionFocusNode = FocusNode();
  final _countryFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _bedFocusNode = FocusNode();
  final _bathFocusNode = FocusNode();
  final _loungeFocusNode = FocusNode();
  final _studyFocusNode = FocusNode();
  final _garageParkingFocusNode = FocusNode();
  final _offStreetParkingFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _featureHeaderFocusNode = FocusNode();
  final _featureBodyFocusNode = FocusNode();
  final _chattelHeaderFocusNode = FocusNode();
  final _chattelBodyFocusNode = FocusNode();

  int userId = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final listingProvider = Provider.of<ListingProvider>(context);

    Listing _editListing;

    String existingListing = "";
    if (ModalRoute.of(context).settings.arguments != null) {
      existingListing = ModalRoute.of(context).settings.arguments;
      _editListing = listingProvider.findById(existingListing);
    }

    Listing _aListing = Listing(
        listingId: existingListing.isEmpty
            ? Random().nextInt(1000000).toString()
            : existingListing, //if edited keeps the existing id
        ownerId: userId,
        address: Address(
            streetNumber: "0",
            streetName: "",
            suburb: "",
            city: "",
            region: "",
            country: ""),
        price: 0,
        bed: 0,
        bath: 0,
        lounge: 0,
        study: 0,
        dining: 0,
        garageParking: 0,
        offSiteParking: 0,
        views: 0,
        offers: 0,
        isFavourite: false,
        listingDescription: ListingDescription(
            descriptionHeader: "",
            descriptionBody: "",
            features: List<Features>(),
            chattels: List<Chattels>()),
        photos: List<Photos>());
    Features _feature = Features(
        featureId: Random().nextInt(1000000).toString(),
        featureHeader: "",
        featureBody: "");
    Chattels _chattel = Chattels(
        chattelId: Random().nextInt(1000000).toString(),
        chattelHeader: "",
        chattelBody: "");

    void _saveForm() {
      final isValid = _form.currentState.validate();
      if (!isValid) {
        return;
      }
      _form.currentState.save();
      if (existingListing.isNotEmpty) {
        //edited property
        listingProvider.updateListing(_editListing);
      } else {
        //add property
        listingProvider.addListing(_aListing);
      }

      Navigator.of(context).pop();
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
              onPressed: () {},
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
          padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 20),
          child: Column(
            children: <Widget>[
              Text(
                'List a New Property',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    letterSpacing: .25,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        height: height / 1.6,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _form,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing
                                          .listingDescription.descriptionHeader
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'Title'),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _streetNumberFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a value';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    _aListing.listingDescription
                                        .descriptionHeader = val;
                                    _editListing.listingDescription
                                        .descriptionHeader = val;
                                  },
                                ),
                                TextFormField(
                                    initialValue: existingListing.isNotEmpty
                                        ? _editListing.address.streetNumber
                                        : "",
                                    decoration: InputDecoration(
                                        labelText: 'Street Number'),
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _streetNumberFocusNode,
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(context).requestFocus(
                                          _streetNameFocusNode); //after submitted goes to the price field
                                    },
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'Please provide a value';
                                      }
                                      if (double.tryParse(val) == null) {
                                        return 'Please provide a vaild number';
                                      }
                                      if (double.parse(val) <= 0) {
                                        return 'Please enter a number greater than zero';
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      _aListing.address.streetNumber = val;
                                      _editListing.address.streetNumber = val;
                                    }),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.address.streetName
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'Street Name'),
                                  focusNode: _streetNameFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _suburbFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a Street Name';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.address.streetName = val;
                                    _editListing.address.streetName = val;
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.address.suburb
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'Suburb'),
                                  focusNode: _suburbFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _cityFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a Suburb';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.address.suburb = val;
                                    _editListing.address.suburb = val;
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.address.city
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'City'),
                                  focusNode: _cityFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _regionFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a City';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.address.city = val;
                                    _editListing.address.city = val;
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.address.region
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'Region'),
                                  focusNode: _regionFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _countryFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a region';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.address.region = val;
                                    _editListing.address.region = val;
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.address.country
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'Country'),
                                  focusNode: _countryFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _priceFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a Country';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.address.country = val;
                                    _editListing.address.country = val;
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.price.toString()
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'Price'),
                                  keyboardType: TextInputType.number,
                                  focusNode: _priceFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _bedFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a value';
                                    }
                                    if (double.tryParse(val) == null) {
                                      return 'Please provide a vaild number';
                                    }
                                    if (double.parse(val) <= 0) {
                                      return 'Please enter a number greater than zero';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.price = int.parse(val);
                                    _editListing.price = int.parse(val);
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.bed.toString()
                                      : "",
                                  decoration: InputDecoration(
                                      labelText: 'Number of Bedrooms'),
                                  keyboardType: TextInputType.number,
                                  focusNode: _bedFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _bathFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a value';
                                    }
                                    if (double.tryParse(val) == null) {
                                      return 'Please provide a vaild number';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.bed = int.parse(val);
                                    _editListing.bed = int.parse(val);
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.bath.toString()
                                      : "",
                                  decoration: InputDecoration(
                                      labelText: 'Number of Bathrooms'),
                                  keyboardType: TextInputType.number,
                                  focusNode: _bathFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _loungeFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a value';
                                    }
                                    if (double.tryParse(val) == null) {
                                      return 'Please provide a vaild number';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.bath = int.parse(val);
                                    _editListing.bath = int.parse(val);
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.lounge.toString()
                                      : "",
                                  decoration: InputDecoration(
                                      labelText: 'Number of Lounges'),
                                  keyboardType: TextInputType.number,
                                  focusNode: _loungeFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _studyFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a value';
                                    }
                                    if (double.tryParse(val) == null) {
                                      return 'Please provide a vaild number';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.lounge = int.parse(val);
                                    _editListing.lounge = int.parse(val);
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.study.toString()
                                      : "",
                                  decoration: InputDecoration(
                                      labelText: 'Number of studies'),
                                  keyboardType: TextInputType.number,
                                  focusNode: _studyFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _garageParkingFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a value';
                                    }
                                    if (double.tryParse(val) == null) {
                                      return 'Please provide a vaild number';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.study = int.parse(val);
                                    _editListing.study = int.parse(val);
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.garageParking.toString()
                                      : "",
                                  decoration: InputDecoration(
                                      labelText: 'Garage Parking Spots'),
                                  keyboardType: TextInputType.number,
                                  focusNode: _garageParkingFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _offStreetParkingFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a value';
                                    }
                                    if (double.tryParse(val) == null) {
                                      return 'Please provide a vaild number';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.garageParking = int.parse(val);
                                    _editListing.garageParking = int.parse(val);
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.offSiteParking.toString()
                                      : "",
                                  decoration: InputDecoration(
                                      labelText: 'Off Street Parking Spots'),
                                  keyboardType: TextInputType.number,
                                  focusNode: _offStreetParkingFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _featureHeaderFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a value';
                                    }
                                    if (double.tryParse(val) == null) {
                                      return 'Please provide a vaild number';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.offSiteParking = int.parse(val);
                                    _editListing.offSiteParking =
                                        int.parse(val);
                                  },
                                ),

                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.listingDescription
                                          .features[0].featureHeader
                                      : "", //probabaly cause issues
                                  decoration: InputDecoration(
                                      labelText: 'Feature Header'),
                                  focusNode: _featureHeaderFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _featureBodyFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a header';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _feature.featureHeader = val;
                                    _feature.featureHeader = val;
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.listingDescription
                                          .features[0].featureBody
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'Feature'),
                                  focusNode: _featureBodyFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _chattelHeaderFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a feature e.g. landsize';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _feature.featureBody = val;
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.listingDescription
                                          .chattels[0].chattelHeader
                                      : "",
                                  decoration: InputDecoration(
                                      labelText: 'Chattel Header'),
                                  focusNode: _chattelHeaderFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _chattelBodyFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a header e.g kitchen';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _chattel.chattelHeader = val;
                                  },
                                ),
                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing.listingDescription
                                          .chattels[0].chattelBody
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'Chattel'),
                                  focusNode: _chattelBodyFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _descriptionFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a chattel e.g dishwasher';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _chattel.chattelBody = val;
                                  },
                                ),

                                TextFormField(
                                  initialValue: existingListing.isNotEmpty
                                      ? _editListing
                                          .listingDescription.descriptionBody
                                      : "",
                                  decoration:
                                      InputDecoration(labelText: 'Description'),
                                  maxLines: 15,
                                  focusNode: _descriptionFocusNode,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(
                                        _featureHeaderFocusNode); //after submitted goes to the price field
                                  },
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Please provide a description';
                                    }

                                    return null;
                                  },
                                  onSaved: (val) {
                                    _aListing.listingDescription
                                        .descriptionBody = val;
                                    _editListing.listingDescription
                                        .descriptionBody = val;
                                  },
                                ),
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                //   children: <Widget>[
                                //     Container(
                                //       width: 100,
                                //       height: 100,
                                //       margin: EdgeInsets.only(top: 8, right: 10),
                                //       decoration: BoxDecoration(
                                //         border: Border.all(
                                //             width: 1, color: Colors.grey),
                                //       ),
                                //       child: _imageUrlController.text.isEmpty
                                //           ? Text('Enter URL')
                                //           : FittedBox(
                                //               child: Image.network(
                                //                   _imageUrlController.text,
                                //                   fit: BoxFit.cover),
                                //             ),
                                //     ),
                                //     Expanded(
                                //       child: TextFormField(
                                //         decoration: InputDecoration(
                                //             labelText: 'Image URL'),
                                //         keyboardType: TextInputType.url,
                                //         textInputAction: TextInputAction.done,
                                //         controller: _imageUrlController,
                                //         focusNode: _imageUrlFocusNode,
                                //         onFieldSubmitted: (_) {
                                //           _saveForm();
                                //         },
                                //         validator: (val) {
                                //           if (val.isEmpty) {
                                //             return 'Please provide a description';
                                //           }
                                //           if (!val.startsWith('http') &&
                                //               !val.startsWith('https')) {
                                //             return 'Unvalid url';
                                //           }
                                //           return null;
                                //         },
                                //         onSaved: (val) {
                                //           _editedProduct = Product(
                                //               title: _editedProduct.title,
                                //               price: _editedProduct.price,
                                //               description:
                                //                   _editedProduct.description,
                                //               imageUrl: val,
                                //               id: _editedProduct.id,
                                //               isFavourite:
                                //                   _editedProduct.isFavourite);
                                //         },
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: GoogleFonts.lato(
                    // posible heading style. will move to theme
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .25,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                color: Colors.blue,
                onPressed: () {
                  //adds feature details to features
                  _aListing.listingDescription.features.add(_feature);
                  _editListing.listingDescription.features.add(_feature);
                  //adds chattel details to chattels
                  _aListing.listingDescription.chattels.add(_chattel);
                  _editListing.listingDescription.chattels.add(_chattel);

                  _aListing.photos.add(Photos(
                      photoId: Random().nextInt(1000000).toString(),
                      url: 'assets/502GroveRd.jpg'));
                  _saveForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
