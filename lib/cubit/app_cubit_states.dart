import 'package:bloctutorial/model/data_model.dart';
import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable{}

class InitialState extends CubitStates{

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitStates{

  LoadedState(this.splaces);
  final List<DataModel> splaces;

  @override
  // TODO: implement props
  List<Object> get props => [splaces];
}

class DetailState extends CubitStates{

  DetailState(this.splace);
  final DataModel splace;

  @override
  // TODO: implement props
  List<Object> get props => [splace];
}