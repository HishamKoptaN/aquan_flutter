abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationPageChanged extends NavigationState {
  final int pageIndex;

  NavigationPageChanged(this.pageIndex);
}
