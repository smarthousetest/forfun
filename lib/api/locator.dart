import 'package:fap/api/api_cubit.dart';
import 'package:fap/api/repo.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

final cardRepository = CardRepository();
Future<void> init() async {
  sl.registerFactory(() => CardCubit(cardRepository));
}
