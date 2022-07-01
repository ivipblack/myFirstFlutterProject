import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/Home/fourth_page/resort_card.dart';
import 'package:testapp/database/base_database_repository.dart';

import '../storage/storage_reporsitory.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<ResortCard> getResortCard() {
    return _firebaseFirestore
        .collection('cards')
        .doc('JU9wF91J1BEVwl7vuOEO')
        .snapshots()
        .map(
          (snap) => ResortCard.fromSnapshot(snap),
        );
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadURL(imageName);

    return _firebaseFirestore
        .collection('cards')
        .doc('JU9wF91J1BEVwl7vuOEO')
        .update(({
          'imageUrls': FieldValue.arrayUnion([downloadUrl])
        }));
  }
}
