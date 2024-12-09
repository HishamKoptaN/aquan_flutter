import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/singletons/account.dart';
part 'accounts_event.freezed.dart';

@freezed
class AccountsEvent with _$AccountsEvent {
  const factory AccountsEvent.get() = _Get;
  const factory AccountsEvent.edit({
    required List<Account> accounts,
  }) = _Edit;
}
