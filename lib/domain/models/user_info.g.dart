// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_info;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserInfo> _$userInfoSerializer = new _$UserInfoSerializer();

class _$UserInfoSerializer implements StructuredSerializer<UserInfo> {
  @override
  final Iterable<Type> types = const [UserInfo, _$UserInfo];
  @override
  final String wireName = 'UserInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, UserInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.login != null) {
      result
        ..add('login')
        ..add(serializers.serialize(object.login,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.img != null) {
      result
        ..add('img')
        ..add(serializers.serialize(object.img,
            specifiedType: const FullType(String)));
    }
    if (object.rating != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(object.rating,
            specifiedType: const FullType(int)));
    }
    if (object.place != null) {
      result
        ..add('place')
        ..add(serializers.serialize(object.place,
            specifiedType: const FullType(int)));
    }
    if (object.steps != null) {
      result
        ..add('steps')
        ..add(serializers.serialize(object.steps,
            specifiedType: const FullType(int)));
    }
    if (object.macroregionId != null) {
      result
        ..add('macroregion_id')
        ..add(serializers.serialize(object.macroregionId,
            specifiedType: const FullType(int)));
    }
    if (object.macroregionName != null) {
      result
        ..add('macroregion_name')
        ..add(serializers.serialize(object.macroregionName,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'place':
          result.place = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'steps':
          result.steps = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'macroregion_id':
          result.macroregionId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'macroregion_name':
          result.macroregionName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserInfo extends UserInfo {
  @override
  final int id;
  @override
  final String login;
  @override
  final String name;
  @override
  final String img;
  @override
  final int rating;
  @override
  final int place;
  @override
  final int steps;
  @override
  final int macroregionId;
  @override
  final String macroregionName;

  factory _$UserInfo([void Function(UserInfoBuilder) updates]) =>
      (new UserInfoBuilder()..update(updates)).build();

  _$UserInfo._(
      {this.id,
      this.login,
      this.name,
      this.img,
      this.rating,
      this.place,
      this.steps,
      this.macroregionId,
      this.macroregionName})
      : super._();

  @override
  UserInfo rebuild(void Function(UserInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserInfoBuilder toBuilder() => new UserInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserInfo &&
        id == other.id &&
        login == other.login &&
        name == other.name &&
        img == other.img &&
        rating == other.rating &&
        place == other.place &&
        steps == other.steps &&
        macroregionId == other.macroregionId &&
        macroregionName == other.macroregionName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), login.hashCode),
                                name.hashCode),
                            img.hashCode),
                        rating.hashCode),
                    place.hashCode),
                steps.hashCode),
            macroregionId.hashCode),
        macroregionName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserInfo')
          ..add('id', id)
          ..add('login', login)
          ..add('name', name)
          ..add('img', img)
          ..add('rating', rating)
          ..add('place', place)
          ..add('steps', steps)
          ..add('macroregionId', macroregionId)
          ..add('macroregionName', macroregionName))
        .toString();
  }
}

class UserInfoBuilder implements Builder<UserInfo, UserInfoBuilder> {
  _$UserInfo _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _img;
  String get img => _$this._img;
  set img(String img) => _$this._img = img;

  int _rating;
  int get rating => _$this._rating;
  set rating(int rating) => _$this._rating = rating;

  int _place;
  int get place => _$this._place;
  set place(int place) => _$this._place = place;

  int _steps;
  int get steps => _$this._steps;
  set steps(int steps) => _$this._steps = steps;

  int _macroregionId;
  int get macroregionId => _$this._macroregionId;
  set macroregionId(int macroregionId) => _$this._macroregionId = macroregionId;

  String _macroregionName;
  String get macroregionName => _$this._macroregionName;
  set macroregionName(String macroregionName) =>
      _$this._macroregionName = macroregionName;

  UserInfoBuilder();

  UserInfoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _login = _$v.login;
      _name = _$v.name;
      _img = _$v.img;
      _rating = _$v.rating;
      _place = _$v.place;
      _steps = _$v.steps;
      _macroregionId = _$v.macroregionId;
      _macroregionName = _$v.macroregionName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserInfo;
  }

  @override
  void update(void Function(UserInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserInfo build() {
    final _$result = _$v ??
        new _$UserInfo._(
            id: id,
            login: login,
            name: name,
            img: img,
            rating: rating,
            place: place,
            steps: steps,
            macroregionId: macroregionId,
            macroregionName: macroregionName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
