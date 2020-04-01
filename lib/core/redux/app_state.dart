import 'package:meta/meta.dart';
import 'package:ucampus/core/models/space.dart';

@immutable
class AppState {
  final List<Space> featuredSpaces;
  final int currentFloor;
  final bool isLoading;

  AppState({
    @required this.featuredSpaces,
    @required this.currentFloor,
    @required this.isLoading,
  });

  static AppState initialState() => AppState(
        featuredSpaces: [],
        currentFloor: 0,
        isLoading: false,
      );

  AppState copy({
    List<Space> featuredSpaces,
    int currentFloor,
    bool isLoading,
  }) =>
      AppState(
        featuredSpaces: featuredSpaces ?? this.featuredSpaces,
        currentFloor: currentFloor ?? this.currentFloor,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  String toString() {
    return this.featuredSpaces.toString() +
        '\n' +
        'currentFloor: ' +
        this.currentFloor.toString() +
        '\n' +
        'isLoading: ' +
        this.isLoading.toString();
  }

  @override
  int get hashCode => this.featuredSpaces.hashCode ^ this.isLoading.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AppState &&
            this.featuredSpaces == other.featuredSpaces &&
            this.currentFloor == other.currentFloor &&
            this.isLoading == this.isLoading);
  }
}
