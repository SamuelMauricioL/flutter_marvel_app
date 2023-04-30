class ThumbnailModel {
  final String path;
  final String fileType;

  ThumbnailModel({
    required this.path,
    required this.fileType,
  });

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) => ThumbnailModel(
        path: json["path"],
        fileType: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": fileType,
      };
}
