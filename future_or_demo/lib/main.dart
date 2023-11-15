import 'dart:async';

import 'package:flutter/material.dart';

FutureOr<int> fetchNumber(bool availableInternet) {

  if (availableInternet) {
    // If some condition is true, return a Future<int>
    return Future.delayed(Duration(seconds: 1), () => 42);
  } else {
    // If the condition is false, return an int directly
    return 42;
  }
}

void main() {

 var number = fetchNumber(true);

 // number.then()


}