using Gee;

class Entry <T> {
    public string id;
    public DateTime createdOn;
    public DateTime updatedOn;
    public HashMap<string,T> map;

    public Entry(string id) {
       this.id = id;
        this.createdOn = new DateTime.now();
        this.map = new HashMap<string, T>();
    }

   public int length() {
       return this.map.size;
   }

   public void addValue(string key, T value) {
       this.updatedOn = new DateTime.now();
       this.map.set(key, value);
   }

   public string[] getKeys () {
       return this.map.keys.to_array();
   }

   public T[] getValues<T>() {
       return this.map.values.to_array();
   }

   public T getValue (string key) {
       return this.map.get(key);
   }
}
