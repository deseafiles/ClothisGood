class ClothModel {
  final String clothId;
  final DateTime createAt;
  final String colot;
  final String blurHash;
  final String description;
  final List<userList> userList;
  final List<photoList> links;

  ClothModel({
      required this.clothId,
      required this.createAt,
    }
  );
}

class userList {
  final String id;
  final String username;
  final String name;
  final String firstName;
  final String lastName;
  final String instagramUsername;
  final String twitterUsername;
  final String portofolioUrl;
}
