import 'package:boilerplate/core/data/local/sembast/sembast_client.dart';
import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/domain/entity/message/chat_thread.dart';
import 'package:boilerplate/domain/entity/post/post.dart';
import 'package:boilerplate/domain/entity/post/post_list.dart';
import 'package:sembast/sembast.dart';

class MessageDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _messageStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
//  Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final SembastClient _sembastClient;

  // Constructor
  MessageDataSource(this._sembastClient);

  // DB functions:--------------------------------------------------------------
  Future<int> insertChatThread(ChatThread chatThread) async {
    int id = await _messageStore
            .record(chatThread.id)
            .add(_sembastClient.database, chatThread.toMap()) ??
        -1;
    return id;
  }

  Future<int> count() async {
    return await _messageStore.count(_sembastClient.database);
  }

  Future<List<ChatThread>> getChatThreads({List<Filter>? filters}) async {
    //creating finder
    final finder = Finder(
        filter: filters != null ? Filter.and(filters) : null,
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _messageStore.find(
      _sembastClient.database,
      finder: finder,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final chatThread = ChatThread.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      chatThread.id = snapshot.key;
      return chatThread;
    }).toList();
  }

  Future<List<ChatThread>> getAllChatThreads() async {
    print('Loading from database');

    // post list
    var chatThreadList;

    // fetching data
    final recordSnapshots = await _messageStore.find(
      _sembastClient.database,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    if (recordSnapshots.length > 0) {
      chatThreadList = recordSnapshots.map((snapshot) {
        final chatThread = ChatThread.fromMap(snapshot.value);
        // An ID is a key of a record from the database.
        chatThread.id = snapshot.key;
        return chatThread;
      }).toList();
    }

    return chatThreadList;
  }

  Future<ChatThread> getChatThreadById(int id) async {
    final finder = Finder(filter: Filter.byKey(id));
    final recordSnapshots = await _messageStore.findFirst(
      _sembastClient.database,
      finder: finder,
    );
    final chatThread = ChatThread.fromMap(recordSnapshots!.value);
    return chatThread;
  }

  Future<int> update(Post post) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _messageStore.update(
      _sembastClient.database,
      post.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(Post post) async {
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _messageStore.delete(
      _sembastClient.database,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _messageStore.drop(
      _sembastClient.database,
    );
  }
}
