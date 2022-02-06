/// [SearchBloc] state managment.
/// [initial] - Initial state.
/// [failure] - Error state, except for [noInternetConnection] and [unexpectedError].
/// [success] - Success state. Data successfully received from the server.
enum SearchStateType {
  initial,
  failure,
  success,
}
