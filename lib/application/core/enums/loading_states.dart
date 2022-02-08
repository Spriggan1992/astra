/// Represents load state enums.
enum LoadingStates {
  /// State of initial loading data.
  ///
  /// This is usually the initial loading state of the screens.
  initial,

  /// State of loading date.
  loading,

  /// Lack of internet connection state.
  noConnectionFailure,

  /// State of unexpected failure.
  unexpectedFailure,

  /// State of successfully loaded data.
  success,
}
