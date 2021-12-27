import 'package:image_picker/image_picker.dart';

/// Desribe image picker service.
abstract class IImagePickerRepository {
  /// Get image.
  Future<XFile?> getImg(ImageSource source);

  /// Get images.
  Future<List<XFile>?> getImgs();
}
