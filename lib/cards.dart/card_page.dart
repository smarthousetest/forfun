import 'package:fap/api/api.dart';
import 'package:fap/api/api_cubit.dart';
import 'package:fap/api/locator.dart';
import 'package:fap/api/states.dart';
import 'package:fap/cards.dart/card_model.dart';
import 'package:fap/info.dart/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

class CardPage extends StatefulWidget {
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  Model authModel = Model();
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  // Future<void> fetch() async {
  //   CardCubit cardCubit = CardCubit(cardRepository);
  //   cardCubit.fetchCard();
  // }

  @override
  Widget build(BuildContext context) {
    CardCubit cardCubit = context.read<CardCubit>();
    cardCubit.fetchCard();
    // cardCubit.fetchCardReferech();
    return Material(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<CardCubit, CardState>(builder: ((context, state) {
              if (state is CardErrorState) {
                return Center(
                  child: Text("Ошибка"),
                );
              }
              if (state is CardLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CardLoadedState) {
                return RefreshIndicator(
                  onRefresh: cardCubit.fetchCardRefresh,
                  child: ListView.builder(
                      itemCount: state.cards!.length,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InfoPage(
                                        index: index,
                                      ),
                                    ));
                              },
                              child: CardView(
                                image: state.cards![index].data!.thumbnail!,
                                title: state.cards![index].data!.title!,
                                text: state.cards![index].data!.selftext!,
                              ),
                            ),
                          ))),
                );
              }
              return Text("");
            }))));
  }
}
