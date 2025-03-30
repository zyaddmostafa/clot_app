import 'package:flutter/material.dart';

class ErrorMessage {
  final String message;
  const ErrorMessage({required this.message});

  @override
  String toString() {
    return 'ErrorMessage: $message';
  }
}
