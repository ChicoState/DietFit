  
class Recipie {
  final String name;
  /*final int id;
  final String name;
  final String tagline;
  final String description;
  final String image_url;
*/

  Recipie.fromJSON(Map<String, dynamic> jsonMap) :
    name = jsonMap['hits']['label'];  

}