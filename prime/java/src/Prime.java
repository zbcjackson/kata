import java.util.ArrayList;
import java.util.List;

public class Prime {
    public static List<Integer> factors(int number) {
        ArrayList<Integer> factors = new ArrayList<Integer>();

        for (int candidate = 2; candidate <= number; candidate++)
            for  (;number % candidate == 0;number /= candidate)
                factors.add(candidate);

        return factors;
    }
}
