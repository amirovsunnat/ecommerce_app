// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toInt(),
      description: json['description'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      color: json['color'] as String?,
      category: json['category'] as String?,
      discount: (json['discount'] as num?)?.toInt(),
      popular: json['popular'] as bool?,
      onSale: json['onSale'] as bool?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'price': instance.price,
      'description': instance.description,
      'brand': instance.brand,
      'model': instance.model,
      'color': instance.color,
      'category': instance.category,
      'discount': instance.discount,
      'popular': instance.popular,
      'onSale': instance.onSale,
    };
