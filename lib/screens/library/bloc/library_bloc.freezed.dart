// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LibraryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LibraryEvent()';
}


}

/// @nodoc
class $LibraryEventCopyWith<$Res>  {
$LibraryEventCopyWith(LibraryEvent _, $Res Function(LibraryEvent) __);
}


/// Adds pattern-matching-related methods to [LibraryEvent].
extension LibraryEventPatterns on LibraryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BooksUpdated value)?  booksUpdated,TResult Function( _BooksLoadFailed value)?  failed,TResult Function( _SearchQueryChanged value)?  searchQueryChanged,TResult Function( _UploadBook value)?  uploadBook,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BooksUpdated() when booksUpdated != null:
return booksUpdated(_that);case _BooksLoadFailed() when failed != null:
return failed(_that);case _SearchQueryChanged() when searchQueryChanged != null:
return searchQueryChanged(_that);case _UploadBook() when uploadBook != null:
return uploadBook(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BooksUpdated value)  booksUpdated,required TResult Function( _BooksLoadFailed value)  failed,required TResult Function( _SearchQueryChanged value)  searchQueryChanged,required TResult Function( _UploadBook value)  uploadBook,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BooksUpdated():
return booksUpdated(_that);case _BooksLoadFailed():
return failed(_that);case _SearchQueryChanged():
return searchQueryChanged(_that);case _UploadBook():
return uploadBook(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BooksUpdated value)?  booksUpdated,TResult? Function( _BooksLoadFailed value)?  failed,TResult? Function( _SearchQueryChanged value)?  searchQueryChanged,TResult? Function( _UploadBook value)?  uploadBook,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BooksUpdated() when booksUpdated != null:
return booksUpdated(_that);case _BooksLoadFailed() when failed != null:
return failed(_that);case _SearchQueryChanged() when searchQueryChanged != null:
return searchQueryChanged(_that);case _UploadBook() when uploadBook != null:
return uploadBook(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( List<LibraryBook> books)?  booksUpdated,TResult Function( String message)?  failed,TResult Function( String query)?  searchQueryChanged,TResult Function( String title,  String? author,  String status,  String? startedAt,  String createdAt,  double progress,  String? coverPath)?  uploadBook,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BooksUpdated() when booksUpdated != null:
return booksUpdated(_that.books);case _BooksLoadFailed() when failed != null:
return failed(_that.message);case _SearchQueryChanged() when searchQueryChanged != null:
return searchQueryChanged(_that.query);case _UploadBook() when uploadBook != null:
return uploadBook(_that.title,_that.author,_that.status,_that.startedAt,_that.createdAt,_that.progress,_that.coverPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( List<LibraryBook> books)  booksUpdated,required TResult Function( String message)  failed,required TResult Function( String query)  searchQueryChanged,required TResult Function( String title,  String? author,  String status,  String? startedAt,  String createdAt,  double progress,  String? coverPath)  uploadBook,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _BooksUpdated():
return booksUpdated(_that.books);case _BooksLoadFailed():
return failed(_that.message);case _SearchQueryChanged():
return searchQueryChanged(_that.query);case _UploadBook():
return uploadBook(_that.title,_that.author,_that.status,_that.startedAt,_that.createdAt,_that.progress,_that.coverPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( List<LibraryBook> books)?  booksUpdated,TResult? Function( String message)?  failed,TResult? Function( String query)?  searchQueryChanged,TResult? Function( String title,  String? author,  String status,  String? startedAt,  String createdAt,  double progress,  String? coverPath)?  uploadBook,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BooksUpdated() when booksUpdated != null:
return booksUpdated(_that.books);case _BooksLoadFailed() when failed != null:
return failed(_that.message);case _SearchQueryChanged() when searchQueryChanged != null:
return searchQueryChanged(_that.query);case _UploadBook() when uploadBook != null:
return uploadBook(_that.title,_that.author,_that.status,_that.startedAt,_that.createdAt,_that.progress,_that.coverPath);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LibraryEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LibraryEvent.started()';
}


}




/// @nodoc


class _BooksUpdated implements LibraryEvent {
  const _BooksUpdated( List<LibraryBook> books): _books = books;
  

 final  List<LibraryBook> _books;
 List<LibraryBook> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of LibraryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BooksUpdatedCopyWith<_BooksUpdated> get copyWith => __$BooksUpdatedCopyWithImpl<_BooksUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BooksUpdated&&const DeepCollectionEquality().equals(other._books, _books));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_books));

@override
String toString() {
  return 'LibraryEvent.booksUpdated(books: $books)';
}


}

/// @nodoc
abstract mixin class _$BooksUpdatedCopyWith<$Res> implements $LibraryEventCopyWith<$Res> {
  factory _$BooksUpdatedCopyWith(_BooksUpdated value, $Res Function(_BooksUpdated) _then) = __$BooksUpdatedCopyWithImpl;
@useResult
$Res call({
 List<LibraryBook> books
});




}
/// @nodoc
class __$BooksUpdatedCopyWithImpl<$Res>
    implements _$BooksUpdatedCopyWith<$Res> {
  __$BooksUpdatedCopyWithImpl(this._self, this._then);

  final _BooksUpdated _self;
  final $Res Function(_BooksUpdated) _then;

/// Create a copy of LibraryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? books = null,}) {
  return _then(_BooksUpdated(
null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<LibraryBook>,
  ));
}


}

/// @nodoc


class _BooksLoadFailed implements LibraryEvent {
  const _BooksLoadFailed(this.message);
  

 final  String message;

/// Create a copy of LibraryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BooksLoadFailedCopyWith<_BooksLoadFailed> get copyWith => __$BooksLoadFailedCopyWithImpl<_BooksLoadFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BooksLoadFailed&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LibraryEvent.failed(message: $message)';
}


}

/// @nodoc
abstract mixin class _$BooksLoadFailedCopyWith<$Res> implements $LibraryEventCopyWith<$Res> {
  factory _$BooksLoadFailedCopyWith(_BooksLoadFailed value, $Res Function(_BooksLoadFailed) _then) = __$BooksLoadFailedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$BooksLoadFailedCopyWithImpl<$Res>
    implements _$BooksLoadFailedCopyWith<$Res> {
  __$BooksLoadFailedCopyWithImpl(this._self, this._then);

  final _BooksLoadFailed _self;
  final $Res Function(_BooksLoadFailed) _then;

/// Create a copy of LibraryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_BooksLoadFailed(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SearchQueryChanged implements LibraryEvent {
  const _SearchQueryChanged(this.query);
  

 final  String query;

/// Create a copy of LibraryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchQueryChangedCopyWith<_SearchQueryChanged> get copyWith => __$SearchQueryChangedCopyWithImpl<_SearchQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'LibraryEvent.searchQueryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchQueryChangedCopyWith<$Res> implements $LibraryEventCopyWith<$Res> {
  factory _$SearchQueryChangedCopyWith(_SearchQueryChanged value, $Res Function(_SearchQueryChanged) _then) = __$SearchQueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchQueryChangedCopyWithImpl<$Res>
    implements _$SearchQueryChangedCopyWith<$Res> {
  __$SearchQueryChangedCopyWithImpl(this._self, this._then);

  final _SearchQueryChanged _self;
  final $Res Function(_SearchQueryChanged) _then;

/// Create a copy of LibraryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_SearchQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UploadBook implements LibraryEvent {
  const _UploadBook({required this.title, this.author, required this.status, this.startedAt, required this.createdAt, required this.progress, this.coverPath});
  

 final  String title;
 final  String? author;
 final  String status;
 final  String? startedAt;
 final  String createdAt;
 final  double progress;
 final  String? coverPath;

/// Create a copy of LibraryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadBookCopyWith<_UploadBook> get copyWith => __$UploadBookCopyWithImpl<_UploadBook>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadBook&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath));
}


@override
int get hashCode => Object.hash(runtimeType,title,author,status,startedAt,createdAt,progress,coverPath);

@override
String toString() {
  return 'LibraryEvent.uploadBook(title: $title, author: $author, status: $status, startedAt: $startedAt, createdAt: $createdAt, progress: $progress, coverPath: $coverPath)';
}


}

/// @nodoc
abstract mixin class _$UploadBookCopyWith<$Res> implements $LibraryEventCopyWith<$Res> {
  factory _$UploadBookCopyWith(_UploadBook value, $Res Function(_UploadBook) _then) = __$UploadBookCopyWithImpl;
@useResult
$Res call({
 String title, String? author, String status, String? startedAt, String createdAt, double progress, String? coverPath
});




}
/// @nodoc
class __$UploadBookCopyWithImpl<$Res>
    implements _$UploadBookCopyWith<$Res> {
  __$UploadBookCopyWithImpl(this._self, this._then);

  final _UploadBook _self;
  final $Res Function(_UploadBook) _then;

/// Create a copy of LibraryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? author = freezed,Object? status = null,Object? startedAt = freezed,Object? createdAt = null,Object? progress = null,Object? coverPath = freezed,}) {
  return _then(_UploadBook(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$LibraryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LibraryState()';
}


}

/// @nodoc
class $LibraryStateCopyWith<$Res>  {
$LibraryStateCopyWith(LibraryState _, $Res Function(LibraryState) __);
}


/// Adds pattern-matching-related methods to [LibraryState].
extension LibraryStatePatterns on LibraryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _LibraryFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _LibraryFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _LibraryFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _LibraryFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _LibraryFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _LibraryFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<LibraryBook> books,  String searchQuery)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.books,_that.searchQuery);case _LibraryFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<LibraryBook> books,  String searchQuery)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.books,_that.searchQuery);case _LibraryFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<LibraryBook> books,  String searchQuery)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.books,_that.searchQuery);case _LibraryFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LibraryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LibraryState.initial()';
}


}




/// @nodoc


class _Loading implements LibraryState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LibraryState.loading()';
}


}




/// @nodoc


class _Loaded implements LibraryState {
  const _Loaded({required  List<LibraryBook> books, required this.searchQuery}): _books = books;
  

 final  List<LibraryBook> _books;
 List<LibraryBook> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

 final  String searchQuery;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._books, _books)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_books),searchQuery);

@override
String toString() {
  return 'LibraryState.loaded(books: $books, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $LibraryStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<LibraryBook> books, String searchQuery
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? books = null,Object? searchQuery = null,}) {
  return _then(_Loaded(
books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<LibraryBook>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LibraryFailure implements LibraryState {
  const _LibraryFailure(this.message);
  

 final  String message;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryFailureCopyWith<_LibraryFailure> get copyWith => __$LibraryFailureCopyWithImpl<_LibraryFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LibraryState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$LibraryFailureCopyWith<$Res> implements $LibraryStateCopyWith<$Res> {
  factory _$LibraryFailureCopyWith(_LibraryFailure value, $Res Function(_LibraryFailure) _then) = __$LibraryFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$LibraryFailureCopyWithImpl<$Res>
    implements _$LibraryFailureCopyWith<$Res> {
  __$LibraryFailureCopyWithImpl(this._self, this._then);

  final _LibraryFailure _self;
  final $Res Function(_LibraryFailure) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_LibraryFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
