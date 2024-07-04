abstract class NavigationEvent {}

class ChangePageEvent extends NavigationEvent {
  final int pageIndex;

  ChangePageEvent(this.pageIndex);
}
