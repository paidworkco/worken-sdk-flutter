extension DataResult on Map<dynamic, dynamic> {
  bool ok() => this['status'] == '1' && this['message'] == 'OK';

  bool notOk() => this['status'] == '0' && this['message'] == 'NOTOK';
}
