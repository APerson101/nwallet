/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the TicketNFT type in your schema. */
class TicketNFT extends amplify_core.Model {
  static const classType = const _TicketNFTModelType();
  final String id;
  final String? _tokenID;
  final List<String>? _urls;
  final String? _location;
  final String? _date;
  final String? _description;
  final int? _quantity;
  final int? _value;
  final String? _name;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TicketNFTModelIdentifier get modelIdentifier {
      return TicketNFTModelIdentifier(
        id: id
      );
  }
  
  String get tokenID {
    try {
      return _tokenID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get urls {
    try {
      return _urls!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get location {
    try {
      return _location!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get date {
    try {
      return _date!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get quantity {
    try {
      return _quantity!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get value {
    try {
      return _value!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TicketNFT._internal({required this.id, required tokenID, required urls, required location, required date, required description, required quantity, required value, required name, createdAt, updatedAt}): _tokenID = tokenID, _urls = urls, _location = location, _date = date, _description = description, _quantity = quantity, _value = value, _name = name, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TicketNFT({String? id, required String tokenID, required List<String> urls, required String location, required String date, required String description, required int quantity, required int value, required String name}) {
    return TicketNFT._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      tokenID: tokenID,
      urls: urls != null ? List<String>.unmodifiable(urls) : urls,
      location: location,
      date: date,
      description: description,
      quantity: quantity,
      value: value,
      name: name);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TicketNFT &&
      id == other.id &&
      _tokenID == other._tokenID &&
      DeepCollectionEquality().equals(_urls, other._urls) &&
      _location == other._location &&
      _date == other._date &&
      _description == other._description &&
      _quantity == other._quantity &&
      _value == other._value &&
      _name == other._name;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TicketNFT {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("tokenID=" + "$_tokenID" + ", ");
    buffer.write("urls=" + (_urls != null ? _urls!.toString() : "null") + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("quantity=" + (_quantity != null ? _quantity!.toString() : "null") + ", ");
    buffer.write("value=" + (_value != null ? _value!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TicketNFT copyWith({String? tokenID, List<String>? urls, String? location, String? date, String? description, int? quantity, int? value, String? name}) {
    return TicketNFT._internal(
      id: id,
      tokenID: tokenID ?? this.tokenID,
      urls: urls ?? this.urls,
      location: location ?? this.location,
      date: date ?? this.date,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      value: value ?? this.value,
      name: name ?? this.name);
  }
  
  TicketNFT copyWithModelFieldValues({
    ModelFieldValue<String>? tokenID,
    ModelFieldValue<List<String>?>? urls,
    ModelFieldValue<String>? location,
    ModelFieldValue<String>? date,
    ModelFieldValue<String>? description,
    ModelFieldValue<int>? quantity,
    ModelFieldValue<int>? value,
    ModelFieldValue<String>? name
  }) {
    return TicketNFT._internal(
      id: id,
      tokenID: tokenID == null ? this.tokenID : tokenID.value,
      urls: urls == null ? this.urls : urls.value,
      location: location == null ? this.location : location.value,
      date: date == null ? this.date : date.value,
      description: description == null ? this.description : description.value,
      quantity: quantity == null ? this.quantity : quantity.value,
      value: value == null ? this.value : value.value,
      name: name == null ? this.name : name.value
    );
  }
  
  TicketNFT.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _tokenID = json['tokenID'],
      _urls = json['urls']?.cast<String>(),
      _location = json['location'],
      _date = json['date'],
      _description = json['description'],
      _quantity = (json['quantity'] as num?)?.toInt(),
      _value = (json['value'] as num?)?.toInt(),
      _name = json['name'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'tokenID': _tokenID, 'urls': _urls, 'location': _location, 'date': _date, 'description': _description, 'quantity': _quantity, 'value': _value, 'name': _name, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'tokenID': _tokenID,
    'urls': _urls,
    'location': _location,
    'date': _date,
    'description': _description,
    'quantity': _quantity,
    'value': _value,
    'name': _name,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TicketNFTModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TicketNFTModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TOKENID = amplify_core.QueryField(fieldName: "tokenID");
  static final URLS = amplify_core.QueryField(fieldName: "urls");
  static final LOCATION = amplify_core.QueryField(fieldName: "location");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final QUANTITY = amplify_core.QueryField(fieldName: "quantity");
  static final VALUE = amplify_core.QueryField(fieldName: "value");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TicketNFT";
    modelSchemaDefinition.pluralName = "TicketNFTS";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TicketNFT.TOKENID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TicketNFT.URLS,
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TicketNFT.LOCATION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TicketNFT.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TicketNFT.DESCRIPTION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TicketNFT.QUANTITY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TicketNFT.VALUE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: TicketNFT.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TicketNFTModelType extends amplify_core.ModelType<TicketNFT> {
  const _TicketNFTModelType();
  
  @override
  TicketNFT fromJson(Map<String, dynamic> jsonData) {
    return TicketNFT.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'TicketNFT';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [TicketNFT] in your schema.
 */
class TicketNFTModelIdentifier implements amplify_core.ModelIdentifier<TicketNFT> {
  final String id;

  /** Create an instance of TicketNFTModelIdentifier using [id] the primary key. */
  const TicketNFTModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'TicketNFTModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TicketNFTModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}