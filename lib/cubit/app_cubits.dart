import 'package:bloctutorial/cubit/app_cubit_states.dart';
import 'package:bloctutorial/model/data_model.dart';
import 'package:bloctutorial/services/data_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({ required this.data}) : super(InitialState()){
   emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async{
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){

    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }
}