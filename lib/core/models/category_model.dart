import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:monee/core/enums/enum.dart';
import 'package:monee/core/extensions/extension.dart';

class CategoryModel {
  const CategoryModel({
    this.id = '',
    this.type = TrackingType.expense,
    this.title = '',
    this.color = const LinearGradient(colors: []),
    this.icon = '',
    this.gradientDirection = GradientDirection.leftToRight,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    final direction = GradientDirection.values.firstWhere(
      (e) => e.name == (map['gradientDirection'] ?? 'leftToRight'),
      orElse: () => GradientDirection.leftToRight,
    );

    return CategoryModel(
      id: map['id'] as String,
      type: TrackingType.fromMap(map['type'] as String),
      title: map['title'] as String,
      icon: map['icon'] as String,
      gradientDirection: direction,
      color: LinearGradient(
        begin: direction.begin,
        end: direction.end,
        colors: (map['color'] as List<dynamic>)
            .map((c) => Color(c as int))
            .toList(),
      ),
    );
  }

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final TrackingType type;
  final String title;
  final LinearGradient color;
  final String icon;
  final GradientDirection gradientDirection;

  CategoryModel copyWith({
    String? id,
    TrackingType? type,
    String? title,
    LinearGradient? color,
    String? icon,
    GradientDirection? gradientDirection,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      gradientDirection: gradientDirection ?? this.gradientDirection,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type.name,
      'title': title,
      'icon': icon,
      'gradientDirection': gradientDirection.name,
      'color': color.colors.map((c) => c.toARGB32()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
