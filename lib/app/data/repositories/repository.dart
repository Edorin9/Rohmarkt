import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../common/errors/exceptions.dart';
import '../../common/errors/failures.dart';
import '../models/market_item.dart';
import '../services/network_info.dart';
import '../sources/dreamshape_api.dart';
import '../sources/json_provider.dart';

class Repository {
  static const fallbackProviderEnabled = true;

  final DreamShapeApi _api;
  final JsonProvider _dummyProvider;
  final NetworkInfo _networkInfo;

  Repository({
    @required DreamShapeApi api,
    @required JsonProvider dummyProvider,
    @required NetworkInfo networkInfo,
  })  : _api = api,
        _dummyProvider = dummyProvider,
        _networkInfo = networkInfo;

  Future<Either<Failure, List<MarketItem>>> getMarketItems() async {
    if (await _networkInfo.isConnected) {
      try {
        final marketItems = await _api.getMarketItems();
        return Right(marketItems);
      } on NetworkException catch (e) {
        return fallbackProviderEnabled
            ? Right(await _dummyProvider.marketItems)
            : Left(NetworkFailure(e.message));
      }
    } else {
      return const Left(ConnectionFailure('Please connect to the internet'));
    }
  }
}
