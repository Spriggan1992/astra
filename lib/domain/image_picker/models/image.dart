import 'package:freezed_annotation/freezed_annotation.dart';
part 'image.freezed.dart';

/// Represent image model.
@freezed
class ImageModel with _$ImageModel {
  const ImageModel._();
  const factory ImageModel({
    /// Image identifier
    int? id,

    /// Imgae url to display.
    required String imageUrl,

    /// Image transformed to base64 for sending to server.
    required String imagePath,
  }) = _ImageModel;
  factory ImageModel.empty() => const ImageModel(
        imagePath: '',
        imageUrl: '',
      );
  bool get imageUrlIsEmpty => imageUrl.isEmpty;
  bool get imagePathIsEmpty => imageUrl.isEmpty;
}
