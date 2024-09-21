// Define states
abstract class BottomNavState {}

class BottomNavInitial extends BottomNavState {}

class BottomNavUpdated extends BottomNavState {
  final int currentIndex;
  BottomNavUpdated(this.currentIndex);
}
