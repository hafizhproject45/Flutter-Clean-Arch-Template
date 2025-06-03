import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) {
  final featName = context.vars['feat_name'] as String;

  String pascalCase(String input) {
    return input
        .split(RegExp(r'[_\-]'))
        .map((e) => e.isEmpty ? '' : e[0].toUpperCase() + e.substring(1))
        .join();
  }

  final pascalName = pascalCase(featName);
  final file = File('lib/injection_container.dart');

  if (!file.existsSync()) {
    context.logger.err('❌ File lib/injection_container.dart tidak ditemukan!');
    return;
  }

  const marker = '// == mason:inject ==';
  String content = file.readAsStringSync();

  if (!content.contains(marker)) {
    context.logger.err(
      '❌ Marker "$marker" tidak ditemukan di injection_container.dart',
    );
    return;
  }

  final injection = '''
//! ${featName}s

  //? Cubit
  sl.registerFactory(() => ${pascalName}Cubit(
    all${pascalName}Usecase: sl(),
    one${pascalName}Usecase: sl(),
    create${pascalName}Usecase: sl(),
    update${pascalName}Usecase: sl(),
    delete${pascalName}Usecase: sl(),
  ));

  //? Usecases
  sl.registerLazySingleton(() => All${pascalName}Usecase(${featName}Repository: sl()));
  sl.registerLazySingleton(() => One${pascalName}Usecase(${featName}Repository: sl()));
  sl.registerLazySingleton(() => Create${pascalName}Usecase(${featName}Repository: sl()));
  sl.registerLazySingleton(() => Update${pascalName}Usecase(${featName}Repository: sl()));
  sl.registerLazySingleton(() => Delete${pascalName}Usecase(${featName}Repository: sl()));

  //? Repository
  sl.registerLazySingleton<${pascalName}Repository>(
    () => ${pascalName}RepositoryImpl(${featName}Datasource: sl()),
  );

  //? Datasource
  sl.registerLazySingleton<${pascalName}Datasource>(
    () => ${pascalName}DatasourceImpl(baseApi: sl()),
  );
''';

  content = content.replaceFirst(marker, '$injection\n$marker');
  file.writeAsStringSync(content);

  context.logger.info(
    '✅ injection_container.dart berhasil diupdate untuk fitur `$featName`',
  );
}
