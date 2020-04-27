import 'package:flutter/material.dart';

import '../Providers/listing_provider.dart';
import '../Providers/user_provider.dart';

import '../Screens/favourites_screen.dart';

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
  final _descriptionHeaderFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _featureHeaderFocusNode = FocusNode();
  final _featureBodyFocusNode = FocusNode();
  final _chattelHeaderFocusNode = FocusNode();
  final _chattelBodyFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              Column(children: <Widget>[
                Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: height/1.6,
                      child: Form(
                        key: _form,
                        
                        child: ListView(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Title'),
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'Street Number'),
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
                                onSaved: (val) {}),
                            TextFormField(
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Suburb'),
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'City'),
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Region'),
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Country'),
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Price'),
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
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
                              onSaved: (val) {},
                            ),
                            
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Feature Header'),
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Feature'),
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Chattel Header'),
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
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Chattel'),
                              focusNode: _chattelBodyFocusNode,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(
                                    _descriptionHeaderFocusNode); //after submitted goes to the price field
                              },
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Please provide a chattel e.g dishwasher';
                                }

                                return null;
                              },
                              onSaved: (val) {},
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Description Header'),
                              focusNode: _descriptionHeaderFocusNode,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(
                                    _descriptionFocusNode); //after submitted goes to the price field
                              },
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Please provide a header';
                                }

                                return null;
                              },
                              onSaved: (val) {},
                            ),
                            TextFormField(
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
                              onSaved: (val) {},
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
              ],
              
              ), 
              SizedBox(height: 10,),
              RaisedButton(child: Text('Submit',style: GoogleFonts.lato(
                    // posible heading style. will move to theme
                    textStyle: TextStyle(
                      letterSpacing: .25,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),), color: Colors.lightBlue, onPressed: (){},),
            ],
          ),
        ),
      ),
    );
  }
}
