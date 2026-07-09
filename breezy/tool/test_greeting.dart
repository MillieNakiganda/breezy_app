import 'package:breezy_backend_client/breezy_backend_client.dart';

Future<void> main() async {
  final client = Client('http://localhost:8080/');
  try {
    final greeting = await client.greeting.hello('Breezy');
    print('SUCCESS: ${greeting.message}');
  } catch (e) {
    print('FAILED: $e');
  } finally {
    client.close();
  }
}
