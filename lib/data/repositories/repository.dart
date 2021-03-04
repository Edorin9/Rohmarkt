import 'package:either_option/either_option.dart';
import 'package:meta/meta.dart';
import 'package:supercharged/supercharged.dart';

import '../../common/errors/exceptions.dart';
import '../../common/errors/failures.dart';
import '../models/market_item.dart';
import '../services/connection_checker.dart';
import '../sources/dreamshape_api.dart';
import '../sources/json_provider.dart';

class Repository {
  static const fallbackAllowed = true;

  final DreamShapeApi _api;
  final JsonProvider _dummyProvider;
  final ConnectionChecker _connectionChecker;

  Repository({
    @required DreamShapeApi api,
    @required JsonProvider dummyProvider,
    @required ConnectionChecker connectionChecker,
  })  : _api = api,
        _dummyProvider = dummyProvider,
        _connectionChecker = connectionChecker;

  Future<Either<Failure, List<MarketItem>>> getMarketItems() {
    return _connectionChecker.handleNetworkJob(() async {
      try {
        final marketItems = await _api.getMarketItems();
        return Right(marketItems);
      } on NetworkException catch (e) {
        if (fallbackAllowed) {
          await Future.delayed(1.seconds);
          final fallbackMarketItems = await _dummyProvider.getMarketItems();
          return Right(fallbackMarketItems);
        } else {
          final failure = NetworkFailure(e.message);
          return Left(failure);
        }
      }
    });
  }
}
