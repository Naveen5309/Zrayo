class ResponseWrapper<TModel> {
  bool? success;
  int? status;
  String? message;
  TModel? data;

  ResponseWrapper({this.success, this.status, this.message, this.data});

  factory ResponseWrapper.fromJson(
      Map<String, dynamic> json,
      TModel Function(Object? json) fromJsonT,
      ) {
    return ResponseWrapper<TModel>(
      success: json['success'] as bool?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null ? null : fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson(Object Function(TModel? value) toJsonT) {
    return {
      'success': success,
      'status': status,
      'message': message,
      'data': data == null ? null : toJsonT(data),
    };
  }
}
