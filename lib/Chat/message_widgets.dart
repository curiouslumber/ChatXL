import 'package:chatdb/Chat/controller.dart';
import 'package:flutter/material.dart';

class AIMessageWidget extends StatelessWidget {
  const AIMessageWidget({
    super.key,
    required this.availableWidth,
    required this.c,
    required this.message,
  });

  final double availableWidth;
  final Controller c;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 8.0, right: 16.0),
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0)),
            color: Color(0xff034B40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text(
            message,
            style: const TextStyle(
                fontFamily: 'Ubuntu', fontSize: 14, color: Colors.white),
          )),
    );
  }
}

class SenderMessageWidget extends StatelessWidget {
  const SenderMessageWidget({
    super.key,
    required this.availableWidth,
    required this.c,
    required this.message,
  });

  final double availableWidth;
  final Controller c;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(bottom: 8.0, left: 16.0),
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text(
            message,
            style: const TextStyle(
                fontFamily: 'Ubuntu', fontSize: 14, color: Color(0xff034B40)),
          )),
    );
  }
}
