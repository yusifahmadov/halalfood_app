T parseJson<T>(
    Map<String, dynamic> json, T Function(Map<String, dynamic> json) fromJson) {
  return fromJson(json);
}
