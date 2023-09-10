import 'package:http/http.dart' as http;
import 'package:mingo_shop/const.dart';

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/categories';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse(
        '$remoteUrl?populate=image',
      ),
    );

    return response;
  }

  // Future<dynamic> getByName({required String keyword}) async {
  //   var response = await client.get(
  //     Uri.parse('$remoteUrl?populate=images,tags&filters[name][\$contains]=$keyword'),
  //   );
  //   return response;
  // }
}
