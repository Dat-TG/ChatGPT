import 'dart:async';

import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/core/stores/form/form_store.dart';
import 'package:boilerplate/domain/repository/setting/setting_repository.dart';
import 'package:boilerplate/domain/usecase/message/delete_chat_thread_usecase.dart';
import 'package:boilerplate/domain/usecase/message/get_all_chat_threads_usecase.dart';
import 'package:boilerplate/domain/usecase/message/save_chat_thread_usecase.dart';
import 'package:boilerplate/domain/usecase/message/send_message_usecase.dart';
import 'package:boilerplate/domain/usecase/message/update_chat_thread_usecase.dart';
import 'package:boilerplate/domain/usecase/post/get_post_usecase.dart';
import 'package:boilerplate/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:boilerplate/presentation/chat_screen/store/chat_store.dart';
import 'package:boilerplate/presentation/home_demo/store/language/language_store.dart';
import 'package:boilerplate/presentation/home_demo/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/new_chat/store/new_chat_store.dart';
import 'package:boilerplate/presentation/post/store/post_store.dart';

import '../../../di/service_locator.dart';

mixin StoreModule {
  static Future<void> configureStoreModuleInjection() async {
    // factories:---------------------------------------------------------------
    getIt.registerFactory(() => ErrorStore());
    getIt.registerFactory(() => FormErrorStore());
    getIt.registerFactory(
      () => FormStore(getIt<FormErrorStore>(), getIt<ErrorStore>()),
    );

    // stores:------------------------------------------------------------------
    getIt.registerSingleton<UserStore>(
      UserStore(
        getIt<IsLoggedInUseCase>(),
        getIt<SaveLoginStatusUseCase>(),
        getIt<LoginUseCase>(),
        getIt<FormErrorStore>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<PostStore>(
      PostStore(
        getIt<GetPostUseCase>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<ThemeStore>(
      ThemeStore(
        getIt<SettingRepository>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<LanguageStore>(
      LanguageStore(
        getIt<SettingRepository>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<NewChatStore>(
      NewChatStore(
        getIt<ErrorStore>(),
        getIt<SendMessageUseCase>(),
        getIt<SaveChatThreadUseCase>(),
      ),
    );

    getIt.registerSingleton<ChatStore>(
      ChatStore(
        getIt<ErrorStore>(),
        getIt<SendMessageUseCase>(),
        getIt<GetAllChatThreadsUseCase>(),
        getIt<UpdateChatThreadUseCase>(),
        getIt<DeleteChatThreadUseCase>(),
      ),
    );
  }
}
