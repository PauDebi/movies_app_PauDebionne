import 'models.dart';

class CreditsResponse {
    int id;
    List<Cast> cast;

    CreditsResponse({
        required this.id,
        required this.cast,
    });

    factory CreditsResponse.fromJson(String str) => CreditsResponse.fromMap(json.decode(str));


    factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
    );
}