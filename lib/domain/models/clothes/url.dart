class Url {
  String raw;
  String regular;
  String small;

  Url({
    required this.raw,
    required this.regular,
    required this.small,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        raw: json['raw'] as String,
        regular: json['regular'] as String,
        small: json['small'] as String,
      );
}
