class RouteConstants {
  final String name;


  String toHalloString() {
    return 'Route{name: $name}';
  }

  const RouteConstants._(this.name);

  static const RouteConstants documentScanner = RouteConstants._('/document_scanner');
  static const RouteConstants documentSummary = RouteConstants._('/document_summary');

}
