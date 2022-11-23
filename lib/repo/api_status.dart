class Success {
  int? code;
  Object? responce;
  int? toatalPage;
  Success({this.code, this.toatalPage, this.responce});
}

class Failure {
  int? code;
  Object? errorResponce;
  Failure({this.code, this.errorResponce});
}
