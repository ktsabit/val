using Gee;

class Document {
    public string name;
    public string id;
    public DateTime createdOn;
    public DateTime updatedOn;
    public UnrolledLinkedList<Entry> entries;
    private uint32 entryIncrementId;

    public Document(string name) {
        this.entryIncrementId = 0;
        this.name = name;
        this.createdOn = new DateTime.now();
        this.id =  Random.int_range(int32.MIN, int32.MAX).to_string();
        this.entries = new UnrolledLinkedList<Entry>();
    }

    public void addEntry<T>(){
        this.updatedOn = new DateTime.now();
        int64 time = new DateTime.now().to_unix();
        uint32 timestamp = (uint32) time;
        uint32 rand = (uint32) Random.int_range(int32.MIN, int32.MAX);
        string id = timestamp.to_string() + rand.to_string() + this.entryIncrementId++.to_string();
        Entry entry = new Entry<T>(id);
        this.entries.add (entry);
    }

    //  //  public void copyEntry<T>(){
    //  //      addEntry<T>();
    //  //  }

    //  public int len() {
    //      return this.entries.size;
    //  }

    public string[] getAllKeys () {
        string[] allKeys = {};
        foreach (Entry entry in this.entries.to_array()) {
            foreach (string val in entry.getKeys()){
                allKeys += val;
            }
        }
        return allKeys;
    }

    public void merge(Document doc) {
        this.updatedOn = new DateTime.now();
        foreach (Entry entry in doc.entries) {
            this.entries.add (entry);
        }
    }

    public int keyValLen() {
        int count = 0;
        foreach (var e in entries) {
            count += e.map.size;
        }
        return count;
    }

    public Document mergeNew(Document doc, string name) {
        Document newDocument = new Document(name);
        newDocument.merge(doc);
        newDocument.merge(this);
        return newDocument;
    }
}