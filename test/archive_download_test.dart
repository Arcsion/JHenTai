import 'package:test/test.dart';
import 'package:archive/archive.dart';

void main() {
  test('Test ZIP file generation', () async {
    // Mock archive data.
    ArchiveDownloadedData mockArchive = ArchiveDownloadedData(
      gid: 1234567,
      folderName: 'Archive-1234567-ComicName',
    );

    // Call the ZIP packing function.
    await _packArchiveFilesIntoZip(mockArchive);

    // Verify the ZIP file exists.
    String zipFilePath = join(downloadSetting.downloadPath.value, mockArchive.folderName, '${mockArchive.gid}.zip');
    expect(File(zipFilePath).existsSync(), isTrue);

    // Verify the ZIP file contains all necessary files.
    Archive archive = ZipDecoder().decodeBytes(File(zipFilePath).readAsBytesSync());
    expect(archive.files.any((file) => file.name == 'ComicInfo.xml'), isTrue);
    expect(archive.files.any((file) => file.name == 'ametadata'), isTrue);
    expect(archive.files.any((file) => file.name.startsWith('Img')), isTrue);

    // Verify original files are deleted.
    Directory archiveDir = Directory(join(downloadSetting.downloadPath.value, mockArchive.folderName));
    expect(archiveDir.list().length, equals(1)); // Only the ZIP file should remain.
  });
}