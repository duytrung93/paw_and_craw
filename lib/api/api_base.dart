class APIBase {
  final Uri Function(String path) buildPath;

  APIBase(this.buildPath);
}
