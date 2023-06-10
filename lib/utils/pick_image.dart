import 'package:image_picker/image_picker.dart';

class PickImage {
  ImagePicker picker = ImagePicker();

  Future<XFile?> pickImageFromCamera() async {
    try {
      final photo = await picker.pickImage(source: ImageSource.camera);
      print("hw");
      return photo;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<XFile?> pickImageFromGallery() async {
    try {
      print("i work");
      final photo = await picker.pickImage(source: ImageSource.camera);
      return photo;
    } catch (e) {
      return null;
    }
  }
}
