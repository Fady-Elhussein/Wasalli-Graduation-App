import 'package:dio/dio.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://wassali.onrender.com/api/v1/',
  ),
);

// ------------- Local connection options -------------
//  final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: 'http://10.0.2.2:8000/api/v1/',
//     ),
//   );