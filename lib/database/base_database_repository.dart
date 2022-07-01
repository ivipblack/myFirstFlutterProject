import 'package:testapp/Home/fourth_page/resort_card.dart';

abstract class BaseDatabaseRepository {
  Stream<ResortCard> getResortCard();
  Future<void> updateUserPictures(String imageName);
}
