import java.util.ArrayList;
import java.util.List;

public class Puzzler {

    public static void main(String[] args) {

        String s = ········;
        String t = s;
        s += ········;
        System.out.println(s);
        System.out.println(t);

        s.toUpperCase();
        System.out.println(s);
        System.out.println(t);

        List<String> list1 = new ArrayList<String>();
        list1.add(s);
        List<String> list2 = list1;
        list2.add(t);
        System.out.println(list1);
        System.out.println(list2);
        
        
    }
}
