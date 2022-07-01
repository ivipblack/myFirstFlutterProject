import 'package:image_picker/image_picker.dart';
import 'package:testapp/Home/fourth_page/resort_card.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(XFile image);
  Future<String> getDownloadURL(String imageName);
}
