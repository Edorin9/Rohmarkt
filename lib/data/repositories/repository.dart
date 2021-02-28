import 'package:dartz/dartz.dart';
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
  final ConnectionChecker _connectionService;

  Repository({
    @required DreamShapeApi api,
    @required JsonProvider dummyProvider,
    @required ConnectionChecker connectionService,
  })  : _api = api,
        _dummyProvider = dummyProvider,
        _connectionService = connectionService;

  Future<Either<Failure, List<MarketItem>>> getMarketItems() {
    return _connectionService.handleNetworkJob(() async {
      try {
        final marketItems = await _api.getMarketItems();
        return Right(marketItems);
      } on NetworkException catch (e) {
        if (fallbackAllowed) {
          await Future.delayed(3.seconds);
          final fallbackMarketItems = await _dummyProvider.getMarketItems();
          return Right(fallbackMarketItems);
        } else {
          return Left(NetworkFailure(e.message));
        }
      }
    });
  }
}
