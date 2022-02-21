abstract class CardState {}

class CardEmptyState extends CardState {}

class CardLoadingState extends CardState {}

class CardLoadedState extends CardState {
  List<dynamic>? loadedCard;
  CardLoadedState({this.loadedCard}) {}
}

class CardErrorState extends CardState {}
