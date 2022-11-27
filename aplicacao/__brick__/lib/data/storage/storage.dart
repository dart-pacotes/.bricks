import 'package:dartz/dartz.dart';
import 'package:{{name.lowerCase().snakeCase()}}/data/data.dart';

export 'file_storage.dart';
export 'preferences_storage.dart';

abstract class Storage<I, O> {
  Future<Either<RequestError, O>> store({
    required final String key,
    required final I data,
  });

  Future<Either<RequestError, O>> lookup({
    required final String key,
  });

  Future<Either<RequestError, bool>> exists({
    required final String key,
  });

  Future<Either<RequestError, void>> evict({
    required final String key,
  });
}
