import 'package:dart_frog/dart_frog.dart';

String? greeting;

Handler middleware(Handler handler) {
  greeting = 'Hi';
  return handler.use(
    provider<String>(
      (context) => greeting ?? 'Hello',
    ),
  );
}
