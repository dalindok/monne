import 'dart:convert';

import 'package:monee/core/enums/enum.dart';
import 'package:monee/core/models/category_model.dart';

class TrackingModel {
  const TrackingModel({
    this.id = '',
    this.type = TrackingType.expense,
    this.title = '',
    this.description = '',
    this.amount = 0,
    this.date = '',
    this.startDate,
    this.category = const CategoryModel(),
  });

  factory TrackingModel.fromMap(Map<String, dynamic> map) {
    return TrackingModel(
      id: map['id'] as String,
      type: TrackingType.fromMap(map['type'] as String),
      title: map['title'] as String,
      description: map['description'] as String,
      amount: map['amount'] as num,
      date: map['date'] as String,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      category: CategoryModel.fromMap(map['category'] as Map<String, dynamic>),
    );
  }

  factory TrackingModel.fromJson(String source) {
    return TrackingModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  final String id;
  final TrackingType type;
  final String title;
  final String description;
  final num amount;
  final String date;
  final String? startDate;
  final CategoryModel category;

  TrackingModel copyWith({
    String? id,
    TrackingType? type,
    String? title,
    String? description,
    num? amount,
    String? date,
    String? startDate,
    CategoryModel? category,
  }) {
    return TrackingModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      startDate: startDate ?? this.startDate,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type.name,
      'title': title,
      'description': description,
      'amount': amount,
      'date': date,
      'startDate': startDate,
      'category': category.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}
