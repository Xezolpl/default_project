// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class Messages {
	const Messages();
	ApplicationMessages get application => ApplicationMessages(this);
}

class ApplicationMessages {
	final Messages _parent;
	const ApplicationMessages(this._parent);
	String get title => """Default project""";
}

