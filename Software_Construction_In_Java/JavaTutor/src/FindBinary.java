import java.util.Arrays;

public class FindBinary {
    
    /**
     * TODO: specification
     */
    public static int findBinary(int x, int[] a) {
        int middle = ········
        if (x < a[middle]) {
            return findBinary(x, Arrays.copyOfRange(a, 0, middle));
        } else if (x > a[middle]) {
            return (middle+1) + findBinary(x, Arrays.copyOfRange(a, middle+1, a.length));
        } else {
            return middle;
        }
    }
}