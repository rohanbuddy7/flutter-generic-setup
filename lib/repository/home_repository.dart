
import 'package:flutter_boilerplate/network/rest_client.dart';

abstract class IHomeRepository{
  Future<String> getHome();
}

class HomeRepository extends IHomeRepository{
  final RestClient restClient;
  HomeRepository({required this.restClient});

  @override
  Future<String> getHome() async {
    //restClient.getHome();
    return "";
  }

}