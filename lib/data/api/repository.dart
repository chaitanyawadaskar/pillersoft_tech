import '../models/login_model/login_model.dart';
import '../models/payment_detail_model/payment_detail_model.dart';
import '../models/sign_up_model/sign_up_model.dart';
import 'api_provider.dart';

class Repository {
  final ApiProvider _provider = ApiProvider();

  Future<LoginModel> login(
    Map<String, String> map,
  ) async {
    final response = await _provider.post(
      url: 'login',
      map: map,
    );
    return LoginModel.fromJson(response);
  }

  Future<SignUpModel> register(
    Map<String, String> map,
  ) async {
    final response = await _provider.post(
      url: 'register',
      map: map,
    );
    return SignUpModel.fromJson(response);
  }
}
