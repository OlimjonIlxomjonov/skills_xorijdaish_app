DateTime _fallbackNow() => DateTime.now();

String parseString(dynamic v) {
  if (v == null) return '';
  return v.toString();
}

int parseInt(dynamic v) {
  if (v == null) return 0;
  if (v is int) return v;
  return int.tryParse(v.toString()) ?? 0;
}

bool parseBool(dynamic v) {
  if (v == null) return false;
  if (v is bool) return v;
  final s = v.toString().toLowerCase();
  return s == 'true' || s == '1';
}

/// Returns a DateTime. If parsing fails, returns fallback (now) or null depending on param.
DateTime parseDateTime(dynamic v, {DateTime? fallback}) {
  if (v == null) return fallback ?? _fallbackNow();
  if (v is DateTime) return v;
  final s = v.toString();
  final dt = DateTime.tryParse(s);
  return dt ?? (fallback ?? _fallbackNow());
}

List<T> parseList<T>(dynamic v, T Function(Map<String, dynamic>) mapper) {
  if (v == null) return <T>[];
  if (v is List) {
    return v.map((e) {
      if (e is Map<String, dynamic>) return mapper(e);
      if (e is Map) return mapper(Map<String, dynamic>.from(e));
      // if e is primitive or wrong shape, try converting to Map
      return mapper(<String, dynamic>{});
    }).toList();
  }
  return <T>[];
}
