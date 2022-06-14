enum VideoType { normal, challenge }

class Video {
  const Video(this.title, this.description, this.type, this.url);
  final String title;
  final String description;
  final VideoType type;
  final String url;
}
