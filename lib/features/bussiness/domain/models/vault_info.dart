class VaultInfo {
  final String name;
  final String icon;
  final String unit;
  final int end;
  final int percent;
  final int total;
  final double value;
  VaultInfo(
      {required this.name,
      required this.icon,
      required this.unit,
      required this.end,
      required this.percent,
      required this.total,
      required this.value});

  factory VaultInfo.fromJson(Map<String, dynamic> json) {
    return VaultInfo(
        name: json['name'],
        icon: json['icon'],
        unit: json['unit'],
        end: json['end'],
        percent: json['percent'],
        total: json['total'],
        value: double.parse(json['value']));
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'unit': unit,
      'end': end,
      'percent': percent,
      'total': total,
      'value': value.toString(),
    };
  }
}
