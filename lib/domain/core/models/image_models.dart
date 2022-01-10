import 'package:astra_app/infrastructure/core/services/images/compressed_images.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_models.freezed.dart';

/// Represent image model.
@freezed
class ImageModel with _$ImageModel {
  const ImageModel._();
  const factory ImageModel({
    /// Image identifier
    int? id,

    /// Imgae url to display.
    required String imageUrl,

    /// Compressed images
    CompressedImages? compressedImages,
  }) = _ImageModel;
  factory ImageModel.empty() => const ImageModel(
        imageUrl: '',
      );
  bool get imageUrlIsEmpty => imageUrl.isEmpty;
  bool get imagePathIsEmpty => imageUrl.isEmpty;
}
