import 'dart:convert';

class Recipe {
  List<ExtendedIngredients>? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? summary;
  List<String>? cuisines;
  List<String>? diets;
  List<Steps>? analyzedInstructions;
  String? spoonacularSourceUrl;

  Recipe(
      {this.id,
      this.title,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl,
      this.image,
      this.summary,
      this.cuisines,
      this.diets,
      this.spoonacularSourceUrl,
      this.analyzedInstructions = const [],
      this.extendedIngredients = const []});

  Recipe.fromJson(Map<String, dynamic> json) {
    if (json['extendedIngredients'] != null) {
      extendedIngredients = <ExtendedIngredients>[];
      json['extendedIngredients'].forEach((v) {
        extendedIngredients!.add(ExtendedIngredients.fromJson(v));
      });
    }
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    image = json['image'];
    summary = json['summary'];
    cuisines = json['cuisines'].cast<String>() ?? [];
    diets = json['diets'].cast<String>() ?? [];
    if (json['analyzedInstructions'] != null) {
      analyzedInstructions = <Steps>[];
      if (json['analyzedInstructions'].isNotEmpty) {
        json['analyzedInstructions'].forEach((v) {
          analyzedInstructions!.add(Steps.fromJson(v));
        });
      }
    }
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
  }

  Map<String, dynamic> toHiveMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }

  String toJson() => json.encode(toHiveMap());

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(id: map['id'], image: map['image'], title: map['title']);
  }

  factory Recipe.fromHive(String source) => Recipe.fromMap(json.decode(source));
}

class ExtendedIngredients {
  int? id;
  String? image;
  String? name;
  String? original;
  num? amount;
  String? unit;

  ExtendedIngredients(
      {this.id, this.image, this.name, this.original, this.amount, this.unit});

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = "https://spoonacular.com/cdn/ingredients_500x500/${json['image']}";
    name = json['name'];
    original = json['original'];
    amount = json['amount'];
    unit = json['unit'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'original': original,
      'amount': amount,
      'unit': unit,
    };
  }

  String toJson() => json.encode(toMap());

  factory ExtendedIngredients.fromMap(Map<String, dynamic> map) {
    return ExtendedIngredients(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      original: map['original'],
      amount: map['amount']?.toInt(),
      unit: map['unit'],
    );
  }

  factory ExtendedIngredients.fromHive(String source) =>
      ExtendedIngredients.fromMap(json.decode(source));
}

class AnalyzedInstructions {
  List<Steps>? steps;

  AnalyzedInstructions({this.steps});

  AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'steps': steps?.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

class Steps {
  int? number;
  String? step;

  Steps({this.number, this.step});

  Steps.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    step = json['step'];
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'step': step,
    };
  }

  String toJson() => json.encode(toMap());

  factory Steps.fromMap(Map<String, dynamic> map) {
    return Steps(
      number: map['number']?.toInt(),
      step: map['step'],
    );
  }

  factory Steps.fromHive(String source) => Steps.fromMap(json.decode(source));
}
