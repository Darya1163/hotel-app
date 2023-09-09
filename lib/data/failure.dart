/// Используется исключительно для отправки сообщений об ошибках в пользовательский интерфейс
class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}
