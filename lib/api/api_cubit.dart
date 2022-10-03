import 'dart:convert';
import 'package:fap/api/api.dart';
import 'package:fap/api/repo.dart';
import 'package:fap/api/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ApiCubit {
  Future<Model> getConfig() async {
    final response = await http.get(
        Uri.parse('https://www.reddit.com/r/flutterdev/new.json'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> cardJson = json.decode(response.body);
      print(cardJson);

      return Model.fromJson(cardJson);
    } else {
      throw Exception('Error fetching users');
    }
  }
}

class CardCubit extends Cubit<CardState> {
  final CardRepository cardRepository;

  CardCubit(this.cardRepository) : super(CardLoadedState());

  Future<void> fetchCard() async {
    try {
      emit(CardLoadingState());
      Model _loaded = await cardRepository.getAllCards();
      List<Child> cards = [];
      cards.addAll(_loaded.data!.children!);
      print("приватная  $_loaded");
      String lastAfter = _loaded.data!.after!;
      emit(CardLoadedState(cards: cards, lastAfter: lastAfter));
    } catch (_) {
      emit(CardErrorState());
    }
  }

  Future<void> fetchCardRefresh() async {
    if (state is CardLoadedState) {
      try {
        CardLoadedState cardLoadedState = state as CardLoadedState;
        emit(CardLoadingState());
        Model _loaded = await cardRepository.getAllCards();
        print("1 = ${_loaded.data!.after}");

        List<Child>? cards = [];
        List<Child>? cardsLast = cardLoadedState.cards;

        if (cardLoadedState.lastAfter == _loaded.data!.after) {
          cards = _loaded.data!.children;
          emit(CardLoadedState(cards: cards, lastAfter: _loaded.data!.after));
        } else {
          cardsLast!.insertAll(0, _loaded.data!.children!);
          emit(CardLoadedState(
              cards: cardsLast, lastAfter: _loaded.data!.after));
        }

        print("приватная  $_loaded");
      } catch (_) {
        emit(CardErrorState());
      }
    }
  }
}
