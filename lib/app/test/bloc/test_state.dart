part of 'test_bloc.dart';

//  @immutable mean that every thing in class is final
@immutable
sealed class TestState {}

final class TestInitial extends TestState {}
