void main() {
    Document document1 = new Document("Document 1");

    Document document2 = new Document("Document 2");

    

    document1.addEntry<int> ();
    Entry<int> entry1 = document1.entries.get(0);
    entry1.addValue("one", 1);
    entry1.addValue("two", 2);
    entry1.addValue("three", 3);
    entry1.addValue("four", 4);
    entry1.addValue("five", 5);
    Entry<int> isThisStillEntry1 = document1.entries.get(0);
    bool stillEntry1 = (isThisStillEntry1 == entry1);
    print("Is still the same? %s\n", stillEntry1.to_string());
    // Gee.Predicate newPred = new Gee.Predicate();

    document2.merge(document1);

    Document document3 = document1.mergeNew(document2, "newDoc");
    document3.getAllKeys();
    document3.entries[0].length();
    //  Entry<int> isThisStillEntry1 = document1.entries.get(0);

    print("size: %d\n", document2.keyValLen());

    foreach (var item in document2.entries) {
        string[] keys = item.getKeys();
        foreach (var key in keys) {
            print("%s\n", key);
        }
    }

    Gee.ArrayList<string> keyArray = new Gee.ArrayList<string>.wrap({"one", "three","five", "two"});

    var entry2 = entry1.map.filter((entry) => {
        if (keyArray.contains(entry.key)) return true;
        else return false;
    });

    print("%d\n", entry1.map.size); // 5
    //  print(@"$(entry2.valid)"); // false

    // ERROR:streamiterator
    //  int i = 0;
    //  bool hasnext = true;
    while (entry2.next()) {
        var p =entry2.get();
        print("%s %d\n", p.key,p.value);
    }
    //  for (var a=0;hasnext;entry2.next()) {
    //      print("%d ",i++);
    //      var p =entry2.get();
    //      print("%s %d\n", p.key,p.value);
    //      hasnext = entry2.has_next();
    //  }

    //  foreach (var l in entry2) {
        
    //  }

    //  Gee.UnrolledLinkedList<int> test = new Gee.UnrolledLinkedList<int> ();
}