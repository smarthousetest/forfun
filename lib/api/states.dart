import 'package:fap/api/api.dart';

abstract class CardState {}

class CardEmptyState extends CardState {}

class CardLoadingState extends CardState {}

class CardLoadedState extends CardState {
  // List<Model>? loadedCard;
  List<Child>? cards;
  String? lastAfter;
  CardLoadedState({this.cards, this.lastAfter}) {}
}

class CardErrorState extends CardState {}
