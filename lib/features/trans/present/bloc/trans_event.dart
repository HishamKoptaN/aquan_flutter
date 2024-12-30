import 'package:freezed_annotation/freezed_annotation.dart';
part 'trans_event.freezed.dart';

@freezed
class TransEvent<T> with _$TransEvent<T> {
  const factory TransEvent.get() = _Get;
}
