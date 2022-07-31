/* 날짜, 시간 관련 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

/// enums
// 날짜 형식 { 시작일, 종료일 }
enum DateType { start, end }

/// global variables
// 현재 시각
final now = DateTime.now();

// 오늘 날짜 (시간 미포함)
final today = ignoreTime(now);

// 어제 날짜
final yesterday = today.subtract(const Duration(days: 1));

// 내일 날짜
final tomorrow = today.add(const Duration(days: 1));

/// global functions
// 날짜에서 시간을 제외하여 반환
DateTime ignoreTime(DateTime date) => DateTime(date.year, date.month, date.day);

// DateTime 형식을 Timestamp 형식으로 변환
Timestamp? toTimestamp(DateTime? date) => date == null
    ? null : Timestamp.fromDate(date);

// 날짜를 문자열 형태로 변환
String? dateToString(String format, DateTime? date) => date == null
    ? null : DateFormat(format).format(date);