class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse.loading({this.message}) : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.message, {this.data}) : status = Status.error;
  ApiResponse.noInternet(this.message) : status = Status.noInternet;
  ApiResponse.unAuthorised(this.message) : status = Status.unAuthorised;
  ApiResponse.timeout(this.message) : status = Status.timeout;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { loading, completed, error, noInternet, unAuthorised, timeout }
