// Define events
abstract class BottomNavEvent {}

class UpdateIndex extends BottomNavEvent {
  final int newIndex;
  UpdateIndex(this.newIndex);
}
