import 'package:drift/drift.dart';

@TableIndex(name: 'a_idx_insert_time', columns: {#insertTime})
@TableIndex(name: 'a_idx_sort_order', columns: {#sortOrder})
@TableIndex(name: 'a_idx_group_name', columns: {#groupName})
@TableIndex(name: 'a_idx_tag_refresh_time', columns: {#tagRefreshTime})
class ArchiveDownloaded extends Table {
  @override
  String? get tableName => 'archive_downloaded_v2';

  IntColumn get gid => integer()();

  TextColumn get token => text()();

  TextColumn get title => text()();

  TextColumn get category => text()();

  IntColumn get pageCount => integer()();

  TextColumn get galleryUrl => text()();

  TextColumn get coverUrl => text()();

  TextColumn get uploader => text().nullable()();

  IntColumn get size => integer()();

  TextColumn get publishTime => text()();

  IntColumn get archiveStatusCode => integer().named('archive_status_index')();

  TextColumn get archivePageUrl => text()();

  TextColumn get downloadPageUrl => text().nullable()();

  TextColumn get downloadUrl => text().nullable()();

  BoolColumn get isOriginal => boolean()();

  TextColumn get insertTime => text()();

  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  TextColumn get groupName => text()();

  TextColumn get tags => text().withDefault(const Constant(''))();

  TextColumn get tagRefreshTime => text().nullable()();

  IntColumn get parseSource => integer().withDefault(const Constant(0))();
  
  @override
  Set<Column<Object>>? get primaryKey => {gid};
}

class ArchiveDownloadedOld extends Table {
  @override
  String? get tableName => 'archive_downloaded';

  IntColumn get gid => integer().named('gid')();

  TextColumn get token => text().named('token')();

  TextColumn get title => text().named('title')();

  TextColumn get category => text().named('category')();

  IntColumn get pageCount => integer().named('pageCount')();

  TextColumn get galleryUrl => text().named('galleryUrl')();

  TextColumn get coverUrl => text().named('coverUrl')();

  TextColumn get uploader => text().nullable().named('uploader')();

  IntColumn get size => integer().named('size')();

  TextColumn get publishTime => text().named('publishTime')();

  IntColumn get archiveStatusIndex => integer().named('archiveStatusIndex')();

  TextColumn get archivePageUrl => text().named('archivePageUrl')();

  TextColumn get downloadPageUrl => text().named('downloadPageUrl').nullable()();

  TextColumn get downloadUrl => text().named('downloadUrl').nullable()();

  BoolColumn get isOriginal => boolean().named('isOriginal')();

  TextColumn get insertTime => text().named('insertTime').nullable()();

  IntColumn get sortOrder => integer().named('sortOrder').withDefault(const Constant(0))();

  TextColumn get groupName => text().named('groupName').nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {gid, isOriginal};
}
