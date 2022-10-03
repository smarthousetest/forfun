import 'package:fap/api/api_cubit.dart';
import 'package:fap/api/states.dart';
import 'package:fap/cards.dart/card_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:link/link.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  int index;

  InfoPage({Key? key, required this.index}) : super(key: key);
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  var defaultText = TextStyle(color: Colors.black);
  var linkText = TextStyle(color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(body: BlocBuilder<CardCubit, CardState>(
        builder: (context, state) {
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
            return SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 25,
                            // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: const Color(0xFFF0F0FF),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child:
                          state.cards![widget.index].data!.thumbnail! == "self"
                              ? Text("No image")
                              : Image.network(
                                  state.cards![widget.index].data!.thumbnail!,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  width: 300,
                                  height: 300,
                                ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  height: 30,
                  thickness: 0.7,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                Text("Оценка: ${state.cards![widget.index].data!.ups!}"),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        state.cards![widget.index].data!.title!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        state.cards![widget.index].data!.selftext!,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )),
                ),
                Divider(
                  height: 30,
                  thickness: 0.7,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Назад')),
                  ),
                )
              ]),
            );
          }
          return Text('data');
        },
      )),
    );
  }
}
