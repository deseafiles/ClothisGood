class Link {
  String html;

  Link({
    required this.html,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        html: json['html'] as String,
      );
}


