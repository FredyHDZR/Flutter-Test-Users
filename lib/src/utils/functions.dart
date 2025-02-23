import 'dart:math';

String generateRandomToken(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random.secure();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
}