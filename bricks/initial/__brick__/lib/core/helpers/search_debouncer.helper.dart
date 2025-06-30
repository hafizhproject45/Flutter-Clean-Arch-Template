import 'dart:async';

///  Panggil [run] setiap kali text berubah.
class SearchDebouncer {
  SearchDebouncer({this.delay = const Duration(milliseconds: 500)});

  final Duration delay;
  Timer? _timer;

  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() => _timer?.cancel();
}
