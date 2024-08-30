// 플러터 첼린지 5일차 과제
void main() {
  var engDict = Dictionary();
  engDict.add({"chicken": "치킨은 맛있엉"});
  engDict.showAll();

  print(engDict.get('chicken'));

  engDict.delete('chicken');
  engDict.showAll();

  engDict.add({"beer": "치킨엔 맥주가 맛있엉"});
  engDict.showAll();

  engDict.update('beer', '치맥은 최고야');
  engDict.showAll();
  print(engDict.count());

  engDict.upsert("beer", "치킨엔 맥주지!");
  engDict.showAll();

  engDict.upsert("piza", "피자도 맛있엉");
  engDict.showAll();

  engDict.exists('beer', printInfo: true);
  engDict.exists('chicken', printInfo: true);

  engDict.bulkAdd([
    {"burger": "햄버거도 맛있엉"},
    {"soju": "소주는 맛없엉"}
  ]);
  engDict.showAll();

  engDict.bulkDelete(["피자도 맛있엉", "소주는 맛없엉"]);
  engDict.showAll();
}

class Dictionary {
  List<Map<String, String>> dictionary = [];

  void add(Map<String, String> newWord) {
    dictionary.add(newWord);
  }

  String get(String findWord) {
    var word = exists(findWord);

    if (word != null) {
      return word[findWord] ?? 'Not found';
    }

    return 'Not found';
  }

  void delete(deleteWord) {
    dictionary.removeWhere((word) => word.containsKey(deleteWord));
  }

  void update(String keyWord, String value) {
    String? oldValue;
    var word = exists(keyWord);

    if (word != null) {
      oldValue = word[keyWord];
      word[keyWord] = value;
    }

    print("'$keyWord'(이)가 '$oldValue'에서 '$value'(으)로 업데이트 되었습니다.");
  }

  void showAll() {
    print(dictionary);
  }

  int count() {
    return dictionary.length;
  }

  void upsert(String keyWord, String value) {
    var word = exists(keyWord);

    if (word != null) {
      update(keyWord, value);
    } else {
      add({keyWord : value});
      print("신규단어 '$keyWord'(을)를 사전에 등록했습니다.");
    }
  }

  Map<String, String>? exists(String keyWord, {bool printInfo = false}) {
    for (var word in dictionary) {
      if (word.containsKey(keyWord)) {
        if (printInfo) {
          print("'$keyWord'(은)는 사전에 존재합니다.");
        }
        return word;
      }
    }
    if (printInfo) {
      print("'$keyWord'(은)는 사전에 존재하지 않습니다.");
    }
    return null;
  }

  void bulkAdd(List<Map<String, String>> newWords) {
    for (var newWord in newWords) {
      dictionary.add(newWord);
    }
  }

  void bulkDelete(List<String> deleteWords) {
    for (var deleteWord in deleteWords) {
      // delete(deleteWord); // key를 기준으로 삭제
      dictionary.removeWhere((word) => word.containsValue(deleteWord));
    }
  }
}
