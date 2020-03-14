class Listings {
  List<Listing> listingsList;

  Listings({this.listingsList});

  Listings.fromJson(Map<String, dynamic> json) {
    if (json['listings-list'] != null) {
      listingsList = new List<Listing>();
      json['listings-list'].forEach((v) {
        listingsList.add(new Listing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listingsList != null) {
      data['listings-list'] = this.listingsList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listing {
  String listingId;
  Address address;
  int price;
  int bed;
  int bath;
  int lounge;
  int dining;
  int study;
  int garageParking;
  int offSiteParking;
  int views;
  int offers;
  List<Photos> photos;
  ListingDescription listingDescription;

  Listing(
      {this.listingId,
      this.address,
      this.price,
      this.bed,
      this.bath,
      this.lounge,
      this.dining,
      this.study,
      this.garageParking,
      this.offSiteParking,
      this.views,
      this.offers,
      this.photos,
      this.listingDescription});

  Listing.fromJson(Map<String, dynamic> json) {
    listingId = json['listing-id'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    price = json['price'];
    bed = json['bed'];
    bath = json['bath'];
    lounge = json['lounge'];
    dining = json['dining'];
    study = json['study'];
    garageParking = json['garage-parking'];
    offSiteParking = json['off-site-parking'];
    views = json['views'];
    offers = json['offers'];
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
    listingDescription = json['listing-description'] != null
        ? new ListingDescription.fromJson(json['listing-description'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listing-id'] = this.listingId;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['price'] = this.price;
    data['bed'] = this.bed;
    data['bath'] = this.bath;
    data['lounge'] = this.lounge;
    data['dining'] = this.dining;
    data['study'] = this.study;
    data['garage-parking'] = this.garageParking;
    data['off-site-parking'] = this.offSiteParking;
    data['views'] = this.views;
    data['offers'] = this.offers;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    if (this.listingDescription != null) {
      data['listing-description'] = this.listingDescription.toJson();
    }
    return data;
  }
}

class Address {
  String streetNumber;
  String streetName;
  String suburb;
  String city;
  String region;
  String country;

  Address(
      {this.streetNumber,
      this.streetName,
      this.suburb,
      this.city,
      this.region,
      this.country});

  Address.fromJson(Map<String, dynamic> json) {
    streetNumber = json['street-number'];
    streetName = json['street-name'];
    suburb = json['suburb'];
    city = json['city'];
    region = json['region'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street-number'] = this.streetNumber;
    data['street-name'] = this.streetName;
    data['suburb'] = this.suburb;
    data['city'] = this.city;
    data['region'] = this.region;
    data['country'] = this.country;
    return data;
  }
}

class Photos {
  String photoId;
  String url;

  Photos({this.photoId, this.url});

  Photos.fromJson(Map<String, dynamic> json) {
    photoId = json['photo-id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo-id'] = this.photoId;
    data['url'] = this.url;
    return data;
  }
}

class ListingDescription {
  String listingDescriptionId;
  String descriptionHeader;
  String descriptionBody;
  List<Features> features;
  List<Chattels> chattels;

  ListingDescription(
      {this.listingDescriptionId,
      this.descriptionHeader,
      this.descriptionBody,
      this.features,
      this.chattels});

  ListingDescription.fromJson(Map<String, dynamic> json) {
    listingDescriptionId = json['listing-description-id'];
    descriptionHeader = json['description-header'];
    descriptionBody = json['description-body'];
    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) {
        features.add(new Features.fromJson(v));
      });
    }
    if (json['chattels'] != null) {
      chattels = new List<Chattels>();
      json['chattels'].forEach((v) {
        chattels.add(new Chattels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listing-description-id'] = this.listingDescriptionId;
    data['description-header'] = this.descriptionHeader;
    data['description-body'] = this.descriptionBody;
    if (this.features != null) {
      data['features'] = this.features.map((v) => v.toJson()).toList();
    }
    if (this.chattels != null) {
      data['chattels'] = this.chattels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String featureId;
  String featureHeader;
  String featureBody;

  Features({this.featureId, this.featureHeader, this.featureBody});

  Features.fromJson(Map<String, dynamic> json) {
    featureId = json['feature-id'];
    featureHeader = json['feature-header'];
    featureBody = json['feature-body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feature-id'] = this.featureId;
    data['feature-header'] = this.featureHeader;
    data['feature-body'] = this.featureBody;
    return data;
  }
}

class Chattels {
  String chattelId;
  String chattelHeader;
  String chattelBody;

  Chattels({this.chattelId, this.chattelHeader, this.chattelBody});

  Chattels.fromJson(Map<String, dynamic> json) {
    chattelId = json['chattel-id'];
    chattelHeader = json['chattel-header'];
    chattelBody = json['chattel-body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chattel-id'] = this.chattelId;
    data['chattel-header'] = this.chattelHeader;
    data['chattel-body'] = this.chattelBody;
    return data;
  }
}
