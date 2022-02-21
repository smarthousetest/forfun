import 'dart:convert';
import 'package:fap/api/api.dart';
import 'package:fap/api/repo.dart';
import 'package:fap/api/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ApiCubit {
  Future<List<AuthModel>> getConfig() async {
    final response = await http
        .get(Uri.parse('https://breakingbadapi.com/api/characters'), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });

    if (response.statusCode == 200) {
      final List<dynamic> cardJson = json.decode(response.body);
      return cardJson.map((json) => AuthModel.fromJson(json)).toList();
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
      List<AuthModel> _loaded = await cardRepository.getAllCards();
      print("приватная  $_loaded");
      emit(CardLoadedState(loadedCard: _loaded));
    } catch (_) {
      emit(CardErrorState());
    }
  }
}
