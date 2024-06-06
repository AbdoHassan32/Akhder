import 'package:akhder/features/Cart/data/models/details.dart';

class Amount {
  Amount({
     required this.total,
    required  this.currency,
    required  this.details,});

  Amount.fromJson(dynamic json) {
    total = json['total'];
    currency = json['currency'];
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
  }
  String? total;
  String? currency;
  Details? details;
Amount copyWith({  String? total,
  String? currency,
  Details? details,
}) => Amount(  total: total ?? this.total,
  currency: currency ?? this.currency,
  details: details ?? this.details,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['currency'] = currency;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    return map;
  }

}

