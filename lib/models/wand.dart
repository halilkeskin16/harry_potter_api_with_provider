class Wand {
  final String wood;
  final String core;
  final double? length;

  Wand({required this.wood, required this.core, this.length});

  factory Wand.fromJson(Map<String, dynamic> json) {
    return Wand(
      wood: json['wood'] ?? '',
      core: json['core'] ?? '',
      length: (json['length'] != null) ? (json['length'] as num).toDouble() : null,
    );
  }
}
