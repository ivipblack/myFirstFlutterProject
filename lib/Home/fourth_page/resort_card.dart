import 'package:cloud_firestore/cloud_firestore.dart';

class ResortCard {
  String id;
  final String ownerName;
  final String resortName;
  final String location;
  final List<dynamic> imageUrls;

  ResortCard(
      {this.id = '',
      required this.ownerName,
      required this.resortName,
      required this.location,
      required this.imageUrls});

  List<Object?> get props => [id, ownerName, resortName, location, imageUrls];
  static ResortCard fromSnapshot(DocumentSnapshot snap) {
    ResortCard resortCard = ResortCard(
        id: snap.id,
        ownerName: snap['Owner name'],
        resortName: snap['Resort name'],
        location: snap['location'],
        imageUrls: snap['imageUrls']);

    return resortCard;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'Owenr name': ownerName,
        'Resort name': resortName,
        'location': location,
        'imageUrls': imageUrls
      };

  static ResortCard fromJson(Map<String, dynamic> json) => ResortCard(
      id: json['id'],
      ownerName: json['Owner name'],
      resortName: json['Resort name'],
      location: json['location'],
      imageUrls: json['imageUrls']);
}
