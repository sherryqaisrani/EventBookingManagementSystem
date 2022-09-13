class SearchEvent {
  int? code;
  List<SearchData>? data;
  String? message;
  String? responseTime;

  SearchEvent({this.code, this.data, this.message, this.responseTime});

  SearchEvent.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <SearchData>[];
      json['data'].forEach((v) {
        data!.add(SearchData.fromJson(v));
      });
    }
    message = json['message'];
    responseTime = json['responseTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['responseTime'] = this.responseTime;
    return data;
  }
}

class SearchData {
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

  SearchData(
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
      this.updatedAt});

  SearchData.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['event_name'] = this.eventName;
    data['event_address'] = this.eventAddress;
    data['no_of_attendres'] = this.noOfAttendres;
    data['price'] = this.price;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['publication_status'] = this.publicationStatus;
    data['cover_image'] = this.coverImage;
    data['description'] = this.description;
    data['NCorrdinate'] = this.nCorrdinate;
    data['ECorrdinate'] = this.eCorrdinate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
