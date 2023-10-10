using Gtk;

public class App : Gtk.Application {
    public App () {
      Object (
        application_id: "com.ktsabit.App",
        flags: ApplicationFlags.DEFAULT_FLAGS
      );
    }

    //  private Array<Box> makeRows (Entry entry) {
    //      Array<Box> rows = new Array<Box>(); 
        
    //      bool heading = true;
    //      foreach (var kv in entry.map.entries) {
    //        Box entryRow = new Box(Orientation.HORIZONTAL,2);
    //        Text idText = new Text();
    //        if (heading) {
    //          idText.set_text (entry.id);
    //        } else {
    //          idText.set_text ("");
    //        }
    //        entryRow.append (idText);
    //        string key = kv.key;
    //        var value = kv.value;
    //        Text keyText = new Text();
    //        Text valueText = new Text();
    //        keyText.set_text (key);
    //        valueText.set_text ((string) value);
    //        entryRow.append (keyText);
    //        entryRow.append (valueText);
    //      }
    //      return rows;
    //  }

  
    public override void activate () {
        var win = new ApplicationWindow (this);
        win.set_size_request (20, 20);
        win.set_default_size (20, 600);
        win.set_title ("Primitive Database");
    
        var btn = new Button.with_label ("Hello World");
        btn.clicked.connect (win.close);
        Box topRow = new Box (Orientation.HORIZONTAL, 5);
        //  topRow.allocate (700, 50, 0, null);
        //  topRow.set_size_request (200, 50);
        topRow.set_margin_top (20);
        topRow.set_margin_bottom (20);
        topRow.set_margin_start (20);
        topRow.set_margin_end (20);
        topRow.set_valign (Align.START);
        topRow.set_halign (Align.FILL);


        DropDown documentDropdown = new DropDown.from_strings ({"hesi","document2"});
        //  var dd = new DropDown (owned GLib.ListModel? model, owned Gtk.Expression? expression);
        documentDropdown.set_size_request (600, 50);        
        documentDropdown.selected = 0;

        Button addDocumentButton = new Button.with_label ("Add Document");
        addDocumentButton.set_size_request (50,50);

        //  Box rows = new Box(Orientation.VERTICAL,5);
        topRow.append (documentDropdown);
        topRow.append (addDocumentButton);

        Box mainLayout = new Box (Orientation.VERTICAL, 10);

        mainLayout.append (topRow);


        Entry<string> entry1 = new Entry<string>("123819");
        entry1.addValue ("test1", "val1");

        Box emulateEntryRow = new Box(Orientation.HORIZONTAL,5);
        Text t1 = new Text ();
        t1.set_text ("test1");
        emulateEntryRow.append (t1);
        //  mainLayout.append (emulateEntryRow);

        Grid table = new Grid();
        Text text1 = new Text ();
        text1.set_text ("Tex1");
        table.set_row_homogeneous (true);
        table.attach (text1, 0, 0);
        table.set_margin_top (20);
        table.set_margin_bottom (20);
        table.set_margin_start (20);
        table.set_margin_end (20);
        var grid = new Grid();

        // Create labels for column headers
        var nameLabel = new Label("Name");
        var ageLabel = new Label("Age");
        var jobLabel = new Label("Job");

        // Add column header labels
        grid.attach(nameLabel, 0, 0, 1, 1); 
        grid.attach(ageLabel, 1, 0, 1, 1);
        grid.attach(jobLabel, 2, 0, 1, 1);

        // Add some sample data rows
        grid.attach(new Label("John"), 0, 1, 1, 1);
        grid.attach(new Label("25"), 1, 1, 1, 1); 
        grid.attach(new Label("Teacher"), 2, 1, 1, 1);

        grid.attach(new Label("Mary"), 0, 2, 1, 1);
        grid.attach(new Label("32"), 1, 2, 1, 1);
        grid.attach(new Label("Engineer"), 2, 2, 1, 1);
        var provider = new Gtk.CssProvider();
        provider.load_from_path("/Users/ktsabit/dev/val/styles.css");
        nameLabel.add_css_class ("header");
        ageLabel.add_css_class ("header");
        jobLabel.add_css_class ("header");
        grid.set_halign (Align.CENTER);
        grid.set_hexpand (true);
        grid.set_column_spacing (100);
        grid.set_row_spacing (20);
        grid.add_css_class ("grid");
        mainLayout.append (grid);


        //  mainLayout.append (makeRows (entry1).index (0));

        win.set_child (mainLayout);
        win.present ();
    }
  
    //  public static int main (string[] args) {
    //      var app = new App ();
    //      return app.run (args);
    //  }
  }