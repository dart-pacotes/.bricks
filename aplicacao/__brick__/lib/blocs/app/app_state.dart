part of 'app_bloc.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppStartSuccess extends AppState {}

class AppStartInProgress extends AppState {}

class AppStartFailure extends AppState {}
