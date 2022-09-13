class EventClass {
  int? code;
  Data? data;
  String? message;
  String? responseTime;

  EventClass({this.code, this.data, this.message, this.responseTime});

  EventClass.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    responseTime = json['responseTime'];
  }
}

class Data {
  int? currentPage;
  List<EventData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <EventData>[];
      json['data'].forEach((v) {
        data!.add(new EventData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class EventData {
  int? id;
  String? userId;
  String? categoryId;
  String? eventName;
  String? eventAddress;
  String? noOfAttendres;
  String? price;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? publicationStatus;
  String? coverImage;
  String? description;
  String? nCorrdinate;
  String? eCorrdinate;
  String? createdAt;
  String? updatedAt;
  Categories? categories;
  Users? users;

  EventData(
      {this.id,
      this.userId,
      this.categoryId,
      this.eventName,
      this.eventAddress,
      this.noOfAttendres,
      this.price,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.publicationStatus,
      this.coverImage,
      this.description,
      this.nCorrdinate,
      this.eCorrdinate,
      this.createdAt,
      this.updatedAt,
      this.categories,
      this.users});

  EventData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    eventName = json['event_name'];
    eventAddress = json['event_address'];
    noOfAttendres = json['no_of_attendres'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    publicationStatus = json['publication_status'];
    coverImage = json['cover_image'];
    description = json['description'];
    nCorrdinate = json['NCorrdinate'];
    eCorrdinate = json['ECorrdinate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['event_name'] = eventName;
    data['event_address'] = eventAddress;
    data['no_of_attendres'] = noOfAttendres;
    data['price'] = price;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['publication_status'] = publicationStatus;
    data['cover_image'] = coverImage;
    data['description'] = description;
    data['NCorrdinate'] = nCorrdinate;
    data['ECorrdinate'] = eCorrdinate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (categories != null) {
      data['categories'] = categories!.toJson();
    }
    if (users != null) {
      data['users'] = users!.toJson();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? userId;
  String? categoryName;
  String? thumbnail;
  String? publicationStatus;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
      this.userId,
      this.categoryName,
      this.thumbnail,
      this.publicationStatus,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryName = json['category_name'];
    thumbnail = json['thumbnail'];
    publicationStatus = json['publication_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['category_name'] = categoryName;
    data['thumbnail'] = thumbnail;
    data['publication_status'] = publicationStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Users(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
