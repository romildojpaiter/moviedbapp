import 'package:dio/dio.dart';
import 'package:moviedbapp/utils/dio_service.dart';

class DioServiceImpl implements DioService {
  //

  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYTZiYThjZDFhZjM4ZmRkNjY1OTc3ZmM1MDkyMDYwMCIsInN1YiI6IjYzZjM3ZGFiY2FhY2EyMDA3YzdkMjE2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.x2c1OB5m4H0-S0FiTbbVwFQOiQwbpG9MxtBn0N2ojgs',
        },
      ),
    );
  }
}
