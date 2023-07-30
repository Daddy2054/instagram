import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final String postUrl;
  final DateTime datePublished;
  final String profImage;
  final List likes;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.postUrl,
    required this.datePublished,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'uid': uid,
      'username': username,
      'postId': postId,
      'postUrl': postUrl,
      'datePublished': datePublished.millisecondsSinceEpoch,
      'profImage': profImage,
      'likes': likes,
    };
  }

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        description: snapshot["description"],
        uid: snapshot["uid"],
        likes: snapshot["likes"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage']);
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      description: map['description'] ?? '',
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      postId: map['postId'] ?? '',
      postUrl: map['postUrl'] ?? '',
      datePublished: DateTime.fromMillisecondsSinceEpoch(map['datePublished']),
      profImage: map['profImage'] ?? '',
      likes: List.from(map['likes']),
    );
  }

    Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "likes": likes,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        'postUrl': postUrl,
        'profImage': profImage
      };
}
