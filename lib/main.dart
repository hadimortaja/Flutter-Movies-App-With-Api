import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app_api/presentation/movie_app.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MovieApp());
}

// Future<void> main() async {
//   unawaited(getIt.init());
//   GetTrending getTrending = getIt.getItInstance<GetTrending>();
//   final Either<AppError, List<MovieEntity>> eitherResponse =
//       await getTrending(NoParams());
//   eitherResponse.fold(
//     (l) {
//       print("error");
//       print(l);
//     },
//     (r) {
//       print("List of Movies");
//       print(r);
//     },

    
//   );
//   runApp(MyApp());
// }


