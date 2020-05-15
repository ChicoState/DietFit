import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());


class Album {
    String q;
    int from;
    int to;
    bool more;
    int count;
    List<Hit> hits;

    Album({
        this.q,
        this.from,
        this.to,
        this.more,
        this.count,
        this.hits,
    });

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        q: json["q"],
        from: json["from"],
        to: json["to"],
        more: json["more"],
        count: json["count"],
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "q": q,
        "from": from,
        "to": to,
        "more": more,
        "count": count,
        "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
    };
}

class Hit {
    Recipe recipe;
    bool bookmarked;
    bool bought;

    Hit({
        this.recipe,
        this.bookmarked,
        this.bought,
    });

    factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        recipe: Recipe.fromJson(json["recipe"]),
        bookmarked: json["bookmarked"],
        bought: json["bought"],
    );

    Map<String, dynamic> toJson() => {
        "recipe": recipe.toJson(),
        "bookmarked": bookmarked,
        "bought": bought,
    };
}

class Recipe {
    String uri;
    String label;
    String image;
    String source;
    String url;
    String shareAs;
    int recipeYield;
    List<String> dietLabels;
    List<HealthLabel> healthLabels;
    List<String> cautions;
    List<String> ingredientLines;
    List<Ingredient> ingredients;
    double calories;
    double totalWeight;
    int totalTime;
    Map<String, Total> totalNutrients;
    Map<String, Total> totalDaily;
    List<Digest> digest;

    Recipe({
        this.uri,
        this.label,
        this.image,
        this.source,
        this.url,
        this.shareAs,
        this.recipeYield,
        this.dietLabels,
        this.healthLabels,
        this.cautions,
        this.ingredientLines,
        this.ingredients,
        this.calories,
        this.totalWeight,
        this.totalTime,
        this.totalNutrients,
        this.totalDaily,
        this.digest,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"],
        dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
        healthLabels: List<HealthLabel>.from(json["healthLabels"].map((x) => healthLabelValues.map[x])),
        cautions: List<String>.from(json["cautions"].map((x) => x)),
        ingredientLines: List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
        calories: json["calories"].toDouble(),
        totalWeight: json["totalWeight"].toDouble(),
        totalTime: json["totalTime"],
        totalNutrients: Map.from(json["totalNutrients"]).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
        totalDaily: Map.from(json["totalDaily"]).map((k, v) => MapEntry<String, Total>(k, Total.fromJson(v))),
        digest: List<Digest>.from(json["digest"].map((x) => Digest.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uri": uri,
        "label": label,
        "image": image,
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": List<dynamic>.from(dietLabels.map((x) => x)),
        "healthLabels": List<dynamic>.from(healthLabels.map((x) => healthLabelValues.reverse[x])),
        "cautions": List<dynamic>.from(cautions.map((x) => x)),
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "calories": calories,
        "totalWeight": totalWeight,
        "totalTime": totalTime,
        "totalNutrients": Map.from(totalNutrients).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "totalDaily": Map.from(totalDaily).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "digest": List<dynamic>.from(digest.map((x) => x.toJson())),
    };
}

class Digest {
    String label;
    String tag;
    SchemaOrgTag schemaOrgTag;
    double total;
    bool hasRdi;
    double daily;
    Unit unit;
    List<Digest> sub;

    Digest({
        this.label,
        this.tag,
        this.schemaOrgTag,
        this.total,
        this.hasRdi,
        this.daily,
        this.unit,
        this.sub,
    });

    factory Digest.fromJson(Map<String, dynamic> json) => Digest(
        label: json["label"],
        tag: json["tag"],
        schemaOrgTag: json["schemaOrgTag"] == null ? null : schemaOrgTagValues.map[json["schemaOrgTag"]],
        total: json["total"].toDouble(),
        hasRdi: json["hasRDI"],
        daily: json["daily"].toDouble(),
        unit: unitValues.map[json["unit"]],
        sub: json["sub"] == null ? null : List<Digest>.from(json["sub"].map((x) => Digest.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "tag": tag,
        "schemaOrgTag": schemaOrgTag == null ? null : schemaOrgTagValues.reverse[schemaOrgTag],
        "total": total,
        "hasRDI": hasRdi,
        "daily": daily,
        "unit": unitValues.reverse[unit],
        "sub": sub == null ? null : List<dynamic>.from(sub.map((x) => x.toJson())),
    };
}

enum SchemaOrgTag { FAT_CONTENT, CARBOHYDRATE_CONTENT, PROTEIN_CONTENT, CHOLESTEROL_CONTENT, SODIUM_CONTENT, SATURATED_FAT_CONTENT, TRANS_FAT_CONTENT, FIBER_CONTENT, SUGAR_CONTENT }

final schemaOrgTagValues = EnumValues({
    "carbohydrateContent": SchemaOrgTag.CARBOHYDRATE_CONTENT,
    "cholesterolContent": SchemaOrgTag.CHOLESTEROL_CONTENT,
    "fatContent": SchemaOrgTag.FAT_CONTENT,
    "fiberContent": SchemaOrgTag.FIBER_CONTENT,
    "proteinContent": SchemaOrgTag.PROTEIN_CONTENT,
    "saturatedFatContent": SchemaOrgTag.SATURATED_FAT_CONTENT,
    "sodiumContent": SchemaOrgTag.SODIUM_CONTENT,
    "sugarContent": SchemaOrgTag.SUGAR_CONTENT,
    "transFatContent": SchemaOrgTag.TRANS_FAT_CONTENT
});

enum Unit { G, MG, UNIT_G, EMPTY, KCAL }

final unitValues = EnumValues({
    "%": Unit.EMPTY,
    "g": Unit.G,
    "kcal": Unit.KCAL,
    "mg": Unit.MG,
    "µg": Unit.UNIT_G
});

enum HealthLabel { SUGAR_CONSCIOUS, PEANUT_FREE, TREE_NUT_FREE, ALCOHOL_FREE }

final healthLabelValues = EnumValues({
    "Alcohol-Free": HealthLabel.ALCOHOL_FREE,
    "Peanut-Free": HealthLabel.PEANUT_FREE,
    "Sugar-Conscious": HealthLabel.SUGAR_CONSCIOUS,
    "Tree-Nut-Free": HealthLabel.TREE_NUT_FREE
});

class Ingredient {
    String text;
    double weight;

    Ingredient({
        this.text,
        this.weight,
    });

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        weight: json["weight"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "weight": weight,
    };
}

class Total {
    String label;
    double quantity;
    Unit unit;

    Total({
        this.label,
        this.quantity,
        this.unit,
    });

    factory Total.fromJson(Map<String, dynamic> json) => Total(
        label: json["label"],
        quantity: json["quantity"].toDouble(),
        unit: unitValues.map[json["unit"]],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "quantity": quantity,
        "unit": unitValues.reverse[unit],
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
