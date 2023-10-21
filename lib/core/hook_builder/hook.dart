import 'dart:async';

class Hook<T> {
  final StreamController<T> controller = StreamController<T>.broadcast();
  final T? initialValue;
  Hook({
    required this.initialValue,
  });

  void useState(T value) {
    controller.sink.add(value);
  }

  void unhook() {
    controller.close();
  }

  Future<T> getData() {
    return controller.stream.last;
  }
}
