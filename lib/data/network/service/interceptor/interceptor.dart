import 'package:http/http.dart';

mixin Interceptor {
  Request intercept(Request request);
}
