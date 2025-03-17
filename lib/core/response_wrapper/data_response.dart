class ResponseWrapper<TModel> {
  bool? status;
  int? statusCode;
  String? message;
  TModel? data;

  ResponseWrapper({this.status, this.statusCode, this.message, this.data});

  factory ResponseWrapper.fromJson(
      Map<String, dynamic> json,
      TModel Function(Object? json) fromJsonT,
      ) {
    return ResponseWrapper<TModel>(
      status: json['status'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null ? null : fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson(Object Function(TModel? value) toJsonT) {
    return {
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data == null ? null : toJsonT(data),
    };
  }
}
