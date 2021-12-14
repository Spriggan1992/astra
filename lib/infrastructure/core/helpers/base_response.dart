class BaseResponse<T> {
  final int? status;
  final String? message;
  final T? data;
  const BaseResponse({
    this.status,
    this.message,
    this.data,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'status': status,
  //     'message': message,
  //     'data': data.toMap() ,
  //   };
  // }

  // factory BaseResponse.fromMap(Map<String, dynamic> map) {
  //   return BaseResponse<T>(
  //     status: map['status'] != null ? map['status'] : null,
  //     message: map['message'] != null ? map['message'] : null,
  //     data: map['data'] != null ? T.fromMap(map['data']) : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory BaseResponse.fromJson(String source) =>
  //     BaseResponse.fromMap(json.decode(source));
}
