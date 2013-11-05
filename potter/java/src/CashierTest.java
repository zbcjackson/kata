import static org.junit.Assert.*;

import org.junit.Test;


public class CashierTest {

    public static final double TWO_DIFFERENT_BOOKS_DISCOUNT = 0.05;
    public static final int SINGLE_BOOK_PRICE = 8;
    public static final double TWO_BOOK_DISCOUNT_SUBTOTAL = SINGLE_BOOK_PRICE * 2 * (1 - TWO_DIFFERENT_BOOKS_DISCOUNT);
    public static final double THREE_DIFFERENT_BOOKS_DISCOUNT = 0.10;
    public static final double THREE_DIFFERENT_BOOKS_SUBTOTAL = SINGLE_BOOK_PRICE * 3 * (1 - THREE_DIFFERENT_BOOKS_DISCOUNT);
    public static final double FOUR_DIFFERENT_BOOKS_DISCOUNT = 0.20;
    public static final double FOUR_DIFFERENT_BOOKS_SUBTOTAL = SINGLE_BOOK_PRICE * 4 * (1 - FOUR_DIFFERENT_BOOKS_DISCOUNT);
    public static final double FIVE_DIFFERENT_BOOKS_DISCOUNT = 0.25;
    public static final double FIVE_DIFFERENT_BOOKS_SUBTOTAL = SINGLE_BOOK_PRICE * 5 * (1 - FIVE_DIFFERENT_BOOKS_DISCOUNT);

    @Test
	public void cost_0_for_nothing() {
        assertSubtotalEquals(0);
	}
	
	@Test
	public void one_book_costs_8_euro() {
        assertSubtotalEquals(SINGLE_BOOK_PRICE, BookOfPotter.First);
	}

    @Test
    public void two_same_books_costs_16_euro(){
        assertSubtotalEquals(SINGLE_BOOK_PRICE * 2, BookOfPotter.First, BookOfPotter.First);
    }

    @Test
    public void two_different_books_get_5_percents_discount(){
        assertSubtotalEquals(TWO_BOOK_DISCOUNT_SUBTOTAL, BookOfPotter.First, BookOfPotter.Second);
    }

    @Test
    public void three_different_books_get_10_percents_discount(){
        assertSubtotalEquals(THREE_DIFFERENT_BOOKS_SUBTOTAL, BookOfPotter.First, BookOfPotter.Second, BookOfPotter.Third);
    }

    @Test
    public void four_different_books_get_20_percents_discount(){
        assertSubtotalEquals(FOUR_DIFFERENT_BOOKS_SUBTOTAL, BookOfPotter.First, BookOfPotter.Second, BookOfPotter.Third, BookOfPotter.Forth);
    }

    @Test
    public void five_different_books_get_25_percents_discount(){
        assertSubtotalEquals(FIVE_DIFFERENT_BOOKS_SUBTOTAL, BookOfPotter.First, BookOfPotter.Second, BookOfPotter.Third, BookOfPotter.Forth, BookOfPotter.Fifth);
    }

    @Test
    public void take_as_many_different_books_as_possible_to_get_best_discount(){
        assertSubtotalEquals( TWO_BOOK_DISCOUNT_SUBTOTAL + SINGLE_BOOK_PRICE, BookOfPotter.First, BookOfPotter.First, BookOfPotter.Second);
        assertSubtotalEquals( TWO_BOOK_DISCOUNT_SUBTOTAL * 2,
                BookOfPotter.First, BookOfPotter.First,
                BookOfPotter.Second, BookOfPotter.Second);
        assertSubtotalEquals( FIVE_DIFFERENT_BOOKS_SUBTOTAL +
                FOUR_DIFFERENT_BOOKS_SUBTOTAL +
                SINGLE_BOOK_PRICE,
                BookOfPotter.First, BookOfPotter.First, BookOfPotter.First,
                BookOfPotter.Second, BookOfPotter.Second,
                BookOfPotter.Third, BookOfPotter.Third,
                BookOfPotter.Forth, BookOfPotter.Forth,
                BookOfPotter.Fifth);
    }

    @Test
    public void two_four_different_books_combination_has_better_discount_than_5_different_books_and_3_different_books(){
        assertSubtotalEquals( FOUR_DIFFERENT_BOOKS_SUBTOTAL * 2,
                BookOfPotter.First, BookOfPotter.First,
                BookOfPotter.Second, BookOfPotter.Second,
                BookOfPotter.Third, BookOfPotter.Third,
                BookOfPotter.Forth,
                BookOfPotter.Fifth);
        assertSubtotalEquals( FOUR_DIFFERENT_BOOKS_SUBTOTAL * 4,
                BookOfPotter.First, BookOfPotter.First, BookOfPotter.First, BookOfPotter.First,
                BookOfPotter.Second, BookOfPotter.Second, BookOfPotter.Second, BookOfPotter.Second,
                BookOfPotter.Third, BookOfPotter.Third, BookOfPotter.Third, BookOfPotter.Third,
                BookOfPotter.Forth, BookOfPotter.Forth,
                BookOfPotter.Fifth, BookOfPotter.Fifth);
    }

    private void assertSubtotalEquals(double expectedSubtotal, BookOfPotter... books) {
        Cashier cashier = new Cashier();
        for(BookOfPotter book: books){
            cashier.addBook(book);
        }
        double amount = cashier.checkout();
        assertEquals(expectedSubtotal, amount, 0.009);
    }
}
