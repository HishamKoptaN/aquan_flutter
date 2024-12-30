import 'package:freezed_annotation/freezed_annotation.dart';
part 'dash_event.freezed.dart';

@freezed
class DashEvent<T> with _$DashEvent<T> {
  const factory DashEvent.get() = _Get;
}
