// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Weather {

 double get latitude; double get longitude; List<double> get temperature2m; List<int> get precipitationProbability; List<int> get relativeHumidity2m; List<double> get rain; List<double> get apparentTemperature;
/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherCopyWith<Weather> get copyWith => _$WeatherCopyWithImpl<Weather>(this as Weather, _$identity);

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Weather&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.temperature2m, temperature2m)&&const DeepCollectionEquality().equals(other.precipitationProbability, precipitationProbability)&&const DeepCollectionEquality().equals(other.relativeHumidity2m, relativeHumidity2m)&&const DeepCollectionEquality().equals(other.rain, rain)&&const DeepCollectionEquality().equals(other.apparentTemperature, apparentTemperature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,const DeepCollectionEquality().hash(temperature2m),const DeepCollectionEquality().hash(precipitationProbability),const DeepCollectionEquality().hash(relativeHumidity2m),const DeepCollectionEquality().hash(rain),const DeepCollectionEquality().hash(apparentTemperature));

@override
String toString() {
  return 'Weather(latitude: $latitude, longitude: $longitude, temperature2m: $temperature2m, precipitationProbability: $precipitationProbability, relativeHumidity2m: $relativeHumidity2m, rain: $rain, apparentTemperature: $apparentTemperature)';
}


}

/// @nodoc
abstract mixin class $WeatherCopyWith<$Res>  {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) _then) = _$WeatherCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, List<double> temperature2m, List<int> precipitationProbability, List<int> relativeHumidity2m, List<double> rain, List<double> apparentTemperature
});




}
/// @nodoc
class _$WeatherCopyWithImpl<$Res>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._self, this._then);

  final Weather _self;
  final $Res Function(Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? temperature2m = null,Object? precipitationProbability = null,Object? relativeHumidity2m = null,Object? rain = null,Object? apparentTemperature = null,}) {
  return _then(Weather(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,temperature2m: null == temperature2m ? _self.temperature2m : temperature2m // ignore: cast_nullable_to_non_nullable
as List<double>,precipitationProbability: null == precipitationProbability ? _self.precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as List<int>,relativeHumidity2m: null == relativeHumidity2m ? _self.relativeHumidity2m : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
as List<int>,rain: null == rain ? _self.rain : rain // ignore: cast_nullable_to_non_nullable
as List<double>,apparentTemperature: null == apparentTemperature ? _self.apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [Weather].
extension WeatherPatterns on Weather {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Weather value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Weather value)  $default,){
final _that = this;
switch (_that) {
case _Weather():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Weather value)?  $default,){
final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  List<double> temperature2m,  List<int> precipitationProbability,  List<int> relativeHumidity2m,  List<double> rain,  List<double> apparentTemperature)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that.latitude,_that.longitude,_that.temperature2m,_that.precipitationProbability,_that.relativeHumidity2m,_that.rain,_that.apparentTemperature);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  List<double> temperature2m,  List<int> precipitationProbability,  List<int> relativeHumidity2m,  List<double> rain,  List<double> apparentTemperature)  $default,) {final _that = this;
switch (_that) {
case _Weather():
return $default(_that.latitude,_that.longitude,_that.temperature2m,_that.precipitationProbability,_that.relativeHumidity2m,_that.rain,_that.apparentTemperature);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  List<double> temperature2m,  List<int> precipitationProbability,  List<int> relativeHumidity2m,  List<double> rain,  List<double> apparentTemperature)?  $default,) {final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that.latitude,_that.longitude,_that.temperature2m,_that.precipitationProbability,_that.relativeHumidity2m,_that.rain,_that.apparentTemperature);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Weather implements Weather {
  const _Weather({required this.latitude, required this.longitude, required  List<double> temperature2m, required  List<int> precipitationProbability, required  List<int> relativeHumidity2m, required  List<double> rain, required  List<double> apparentTemperature}): _temperature2m = temperature2m,_precipitationProbability = precipitationProbability,_relativeHumidity2m = relativeHumidity2m,_rain = rain,_apparentTemperature = apparentTemperature;
  factory _Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

@override final  double latitude;
@override final  double longitude;
 final  List<double> _temperature2m;
@override List<double> get temperature2m {
  if (_temperature2m is EqualUnmodifiableListView) return _temperature2m;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_temperature2m);
}

 final  List<int> _precipitationProbability;
@override List<int> get precipitationProbability {
  if (_precipitationProbability is EqualUnmodifiableListView) return _precipitationProbability;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_precipitationProbability);
}

 final  List<int> _relativeHumidity2m;
@override List<int> get relativeHumidity2m {
  if (_relativeHumidity2m is EqualUnmodifiableListView) return _relativeHumidity2m;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relativeHumidity2m);
}

 final  List<double> _rain;
@override List<double> get rain {
  if (_rain is EqualUnmodifiableListView) return _rain;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rain);
}

 final  List<double> _apparentTemperature;
@override List<double> get apparentTemperature {
  if (_apparentTemperature is EqualUnmodifiableListView) return _apparentTemperature;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_apparentTemperature);
}


/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherCopyWith<_Weather> get copyWith => __$WeatherCopyWithImpl<_Weather>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Weather&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._temperature2m, _temperature2m)&&const DeepCollectionEquality().equals(other._precipitationProbability, _precipitationProbability)&&const DeepCollectionEquality().equals(other._relativeHumidity2m, _relativeHumidity2m)&&const DeepCollectionEquality().equals(other._rain, _rain)&&const DeepCollectionEquality().equals(other._apparentTemperature, _apparentTemperature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,const DeepCollectionEquality().hash(_temperature2m),const DeepCollectionEquality().hash(_precipitationProbability),const DeepCollectionEquality().hash(_relativeHumidity2m),const DeepCollectionEquality().hash(_rain),const DeepCollectionEquality().hash(_apparentTemperature));

@override
String toString() {
  return 'Weather(latitude: $latitude, longitude: $longitude, temperature2m: $temperature2m, precipitationProbability: $precipitationProbability, relativeHumidity2m: $relativeHumidity2m, rain: $rain, apparentTemperature: $apparentTemperature)';
}


}

/// @nodoc
abstract mixin class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) _then) = __$WeatherCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, List<double> temperature2m, List<int> precipitationProbability, List<int> relativeHumidity2m, List<double> rain, List<double> apparentTemperature
});




}
/// @nodoc
class __$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(this._self, this._then);

  final _Weather _self;
  final $Res Function(_Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? temperature2m = null,Object? precipitationProbability = null,Object? relativeHumidity2m = null,Object? rain = null,Object? apparentTemperature = null,}) {
  return _then(_Weather(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,temperature2m: null == temperature2m ? _self._temperature2m : temperature2m // ignore: cast_nullable_to_non_nullable
as List<double>,precipitationProbability: null == precipitationProbability ? _self._precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as List<int>,relativeHumidity2m: null == relativeHumidity2m ? _self._relativeHumidity2m : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
as List<int>,rain: null == rain ? _self._rain : rain // ignore: cast_nullable_to_non_nullable
as List<double>,apparentTemperature: null == apparentTemperature ? _self._apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
