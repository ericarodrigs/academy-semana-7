abstract class LocalStorageInterface{
  Future<bool> writeString(String key, String value);

  Future<String?> read(String key);

  Future<void> remove(String key);

  void dispose();
}
