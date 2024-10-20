class NetworkResponse{
  final int statusCode;
  final bool isSuccess;
  dynamic responseData;
  String? errorMsg;

  NetworkResponse( {
    required this.statusCode,
    required this.isSuccess,
    this.responseData,
    this.errorMsg='Something went wrong'
  });

}