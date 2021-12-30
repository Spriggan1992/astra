import 'package:astra_app/domain/image_picker/reopositories/i_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

/// Image picker service.
@LazySingleton(as: IImagePickerRepository)
class ImagePickerRepository extends IImagePickerRepository {
  /// Image picker.
  final ImagePicker _picker;

  ImagePickerRepository(this._picker);

  @override
  Future<XFile?> getImg(ImageSource source) async {
    return _picker.pickImage(source: source);
  }

  @override
  Future<List<XFile>?> getImgs() async {
    return _picker.pickMultiImage();
  }
}
