import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_no/bloc_observer.dart';

import 'package:tic_tac_no/game/bloc/game_bloc.dart';
import 'package:tic_tac_no/app.dart';
import 'package:tic_tac_no/translations/codegen_loader.g.dart';
import 'package:tic_tac_no/utils/audio.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => GameBloc(),
      child: EasyLocalization(
          path: 'assets/translations',
          assetLoader: CodegenLoader(),

          /// don't make country specific so it works in any country
          /// if language matches
          supportedLocales: [
            Locale('en'),
            Locale('af'),
            Locale('ar'),
            Locale('hr'),
            Locale('es'),
            Locale('pl'),
            Locale('he'),
            Locale('zh'),
          ],
          fallbackLocale: Locale('en'),
          child: Provider(
            create: (context) => UIAudio()..preloadSounds(),
            lazy: false,
            child: App(),
          )),
    ),
  );
}
