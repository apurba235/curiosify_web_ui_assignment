part of 'navigation.dart';

class RouteParams {
  RouteParams._();

  static RouteParams instance = RouteParams._();

  ///Define your path params and query params here
  static final fromMenu = _Param('fromMenu', '');
  static final fromCreated = _Param('fromCreated', '');
  static final atsId = _Param('atsId', '');
}

class _Param {
  _Param(this.key, this.value);

  String key;
  String value;

  Map<String, String> toMap() {
    final Map<String, String> map = {};
    map[key] = value;
    return map;
  }
}

extension _RouteParamToMap on List<_Param> {
  Map<String, String> toMap() {
    final Map<String, String> map = {};
    forEach((element) => map[element.key] = element.value);
    return map;
  }
}
