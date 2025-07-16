import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateTimeUtils {
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy hh:mm a').format(dateTime);
  }

  static String formatDateTimeOnlyDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static String formatDateTimeDateTime(DateTime dateTime) {
    final DateTime updatedDateTime = dateTime.add(const Duration(hours: 6));
    try {
      return DateFormat('dd MMM yyyy hh:mm:ss a').format(updatedDateTime);
    } catch (e) {
      return DateFormat('dd MMM yyyy').format(updatedDateTime);
    }
  }

  static String formatRefundDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').add_jm().format(dateTime);
  }

  static String profileUpdateFormat(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').add_jm().format(dateTime);
  }

  static String timeAgo(String dateTimeStr) {
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return timeago.format(dateTime.toLocal()); // Convert to local time
    } catch (_) {
      return '';
    }
  }

  static String getFormatedDate(DateTime orderDate) {
    final DateFormat formatter = DateFormat('dd MMMM, yyyy');
    final String formatted = formatter.format(orderDate);
    return formatted;
  }

  static String getFormatedDateForAPI(DateTime orderDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(orderDate);
    return formatted;
  }
}
