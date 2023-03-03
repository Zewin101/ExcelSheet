import 'package:excelsheet/model/userField_model.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const credenials = r'''
  {
  "type": "service_account",
  "project_id": "excel-379302",
  "private_key_id": "c0acf191bb06897408e6ccead3859d0dd3236fcc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDd/5K+9xkfaelN\n9jHYm71eKxinEY/LbF6rz3m7WMEoh4bfzlDkcDQWer9Q2cAlKYsz/9aq9dASmtmP\nRjFEOtoEL8e4IcGVVZrvbuLeS18e4qFbvF9V0RCtVj7LQmGUPOPuUTs6TCu4kIw9\n03T54laNDdQznVAZpSWlRSgaETbtfvhYmAtHGWyPdgmzPOaj2UjFj16Qgp7b2/qb\n4DyRv9O5GQmjJO8mpGbYdWt+coB21z8ucqq2NPuceQpswMxHKepzPNglOzoZvBmA\nw8lC4F2Rnbw8GTsdq0SazdBV9VP3kY5KEycrLiKQonpEG3GetoVn/ydWTkvPKjOQ\ne7rPIdrdAgMBAAECggEASc+V3QSPR9CRD6jRvfFaLxspITNHmh04BOwAz3edEXqu\nL2+LmchsqSS6w4kCx9hePjXMDB+axPTTbT2rV8Ixhr7UKraehKZn00ANElgBEmXL\nvJKPKBtQ7jEEw9QYWY89QZmklaeJyd3VoyDRfdvxZwi4C0k8vqoYMDEkOjaLCr9U\nAS4BAsdZEGQ+E+9up7HVTeFWCAREA6zlkwQCAQm4pzxog0FZTMQpYenTq6CTBWkJ\naDDZnLjBP1BwlDRXhSmeF03mUEWV56WFnVMCW0HqWQLbzhwyw4mZO79CEZIunXBf\ncdvbc1jei+UJN0CT3TCOF4xKsJHRUyddVe07H+f6CQKBgQD1AkdBYsMG2b2yQ+8Q\nqE3h5eCsk9VQbqCRhnR4i2n/Yc4Iryu6+yOo0gsd/IjAl4LWOgNjrdoeh6T8S2U5\n6hIAoDo2Qgw3WzP6yRXTEl5tQbKCZk9zZ3O+rR7dN3O/QBWY+ATgTaRBF7A6XpYC\nJCCzl8yLHSYLDgvFBcz5W3oePwKBgQDn9QmvNrC4wFlQaDa1NupvgCLRjRYOQcyD\nbMOn9P9pOvdzh0cjCgyqT2gBRBzxH0+5dvUkbTMnbNQOc6Io9jvNVcVzXH/6t6Fd\nTblijfm7LK7CLUqCkCvD/eP8D9FN2qvPsvc1+voCgBIfO3nKlFtGATtBHX7LL/g+\nT4izn0a34wKBgQDpRhgN2ziRBzOjzSaLF5O/px05cy/AevQKWpf+Rc7QRpDil9Xt\nGzwieon3LQAPTrJVwbqEZ3yrYL7nL+nbME+fpO6Hxm7XLdDZ0CclZfHd2JVbromq\n+S6stywRt8BOsXdew5Xw8juXdjRl/rSYqUkxdTBcq44TLHZsSk+Ug1JMBQKBgQDj\nsiGAktIlegPyr2pMtwyoyYLka3ekJSkqNgFWhWSXmt+/06KcHchTAsHYxFEYzSDI\nsaJw0JUvdWAwk4gyZ4xKw5Cg7sNejRXk7mA2A6KK/5DJYgZLZlTf/wHmtGxE3Yxc\nxZRws97px2iCqjKjDsEOVjUhdV+6+2rXV+GcWZTk+wKBgCOu7pHKQZQXS3mYxrb1\n0BbGajepPQEdU8KO8+FogLpL2qmvpvLnZE/WvzoHXl3O0laxy3zl58+FAsQ8fCDU\nskICrWgcXtBS6B8a/zhDnI2u+PyfG+T4QAf4wX0nsZTIZ6tsiaCFpltTGTpWN+G6\nUHLCJkdcGI5mkbgDibI+6TuD\n-----END PRIVATE KEY-----\n",
  "client_email": "rodina-sheet@excel-379302.iam.gserviceaccount.com",
  "client_id": "112616717654746364237",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/rodina-sheet%40excel-379302.iam.gserviceaccount.com"
}
  ''';

  static final spreadsheetId = '12_q-OYNIziVnWPiXrqoz5ptWuTpmeHL6jdnzZNElr-8';

  static final gsheets = GSheets(credenials);

  static Worksheet? userSheet;

  static Future init() async {
    try{
      final spreadsheet = await gsheets.spreadsheet(spreadsheetId);
      userSheet = await getWorkSheet(spreadsheet, title: 'الانصراف');
      final firstRow = UserField.getFields();
      userSheet!.values.insertRow(1, firstRow,fromColumn: 1);
    }catch(e){
      print("Init Error : $e");
    }
  }

  static Future<Worksheet> getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.addWorksheet(title);
    }
  }
static Future<User?>getById(int id)async{
     if(userSheet==null)return null;
    final json=await userSheet!.values.map.rowByKey(id,fromColumn: 1);
    print(json);
    return User.fromJson(json!);


}

  static Future insert(List<Map<String,dynamic>>rowList)async{
    if(userSheet==null)return;
    return await userSheet?.values.map.appendRows(rowList);
  }
static Future<int>getRowCount()async{
  if(userSheet==null)return 0;
  final lastRow=await userSheet!.values.lastRow();
  print(lastRow?.last);
  return lastRow==null? 0: int.tryParse(lastRow.first)??0 ;
}


}
