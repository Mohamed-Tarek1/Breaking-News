import 'package:flutter/material.dart';
Widget Loading() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget error(var error) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(error.toString()),
  );
}

Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("Connectio Error!!!"),
  );
}

Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("No Data Available"),
  );
}
