
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeRepository iHomeRepository;

  HomeCubit({required this.iHomeRepository}) : super(LoadingHome()) {}

  customInitialEmit() {
    emit(InitialState());
  }

  getCountries(int page, {List<int>? ids = null}) async {
    try {
      final data = await iHomeRepository.getHome();
      emit(SuccessHome(data));
    } catch (e) {
      print(e);
      emit(ErrorHome());
    }
  }

}
