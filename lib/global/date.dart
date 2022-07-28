import 'package:cloud_firestore/cloud_firestore.dart';

// 날짜 시간 관련 전역 변수, 메소드

enum DateType { start, end }

final now = DateTime.now();
final today = ignoreTime(now);
final yesterday = today.subtract(const Duration(days: 1));
final tomorrow = today.add(const Duration(days: 1));

DateTime ignoreTime(DateTime date) => DateTime(date.year, date.month, date.day);

Timestamp? toTimestamp(DateTime? date) => date == null ? null : Timestamp.fromDate(date);