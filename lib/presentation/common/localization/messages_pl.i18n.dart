// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'messages.i18n.dart';

String get _languageCode => 'pl';
String get _localeName => 'pl';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class Messages_pl extends Messages {
	const Messages_pl();
	ApplicationMessages_pl get application => ApplicationMessages_pl(this);
}

class ApplicationMessages_pl extends ApplicationMessages {
	final Messages_pl _parent;
	const ApplicationMessages_pl(this._parent):super(_parent);
	String get title => """Default project""";
}

