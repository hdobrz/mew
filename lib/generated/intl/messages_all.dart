import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_en.dart' as messages_en;

typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  'en': () => Future.value(null),
};

MessageLookupByLibrary? _findExact(localeName) {
  switch (localeName) {
    case 'en':
      return messages_en.messages;
    default:
      return null;
  }
}

MessageLookupByLibrary? lookupMessageLibrary(String localeName) {
  var actualLocale = Intl.verifiedLocale(localeName, (locale) => _deferredLibraries.containsKey(locale),
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}

initializeMessages(String localeName) async {
  final lib = _deferredLibraries[localeName];
  if (lib != null) {
    await lib();
  }
  initializeInternalMessageLookup(() => CompositeMessageLookup());
  messageLookup.addLocale(localeName, lookupMessageLibrary);
}
