class ImageUpload {
  String imageUrl;

  ImageUpload({required this.imageUrl});

  ImageUpload.fromJson(Map<String, dynamic> json) : imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = imageUrl;
    return data;
  }
}
