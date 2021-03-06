import 'package:astra_app/core/domain/models/cached_file_image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_models.freezed.dart';

/// Represent image model.
@freezed
class ImageModel with _$ImageModel {
  const ImageModel._();
  const factory ImageModel({
    /// Image identifier
    int? id,

    /// Image url to display.
    required String imageUrl,

    /// Compressed images
    CachedFileImageModel? cachedImage,
  }) = _ImageModel;

  /// Empty object.
  factory ImageModel.empty() => const ImageModel(
        imageUrl: '',
        cachedImage: null,
      );

  bool get imageUrlIsEmpty => imageUrl.isEmpty;
}
