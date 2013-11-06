import org.junit.Test;

import java.util.Arrays;
import java.util.List;
import static org.junit.Assert.assertEquals;

public class PrimeTest {
    @Test
    public void one_has_no_prime_factor(){
        assertEquals(integerList(), Prime.factors(1));
    }

    @Test
    public void prime_factor_of_two_is_itself(){
        assertEquals(integerList(2), Prime.factors(2));
    }

    @Test
    public void prime_factor_of_three_is_itself(){
        assertEquals(integerList(3), Prime.factors(3));
    }

    @Test
    public void four_has_two_and_two_as_prime_factors(){
        assertEquals(integerList(2, 2), Prime.factors(4));
    }

    @Test
    public void eight_has_two_and_two_and_two_as_prime_factors(){
        assertEquals(integerList(2, 2, 2), Prime.factors(8));
    }

    @Test
    public void nine_has_three_and_three_as_prime_factors(){
        assertEquals(integerList(3, 3), Prime.factors(9));
    }

    @Test
    public void prime_factors_of_1025_are_5_5_41(){
        assertEquals(integerList(5, 5, 41), Prime.factors(1025));
    }

    private List<Integer> integerList(Integer... numbers){
        return Arrays.asList(numbers);
    }

}
