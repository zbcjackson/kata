import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

public class Cashier {

    public static final int SINGLE_BOOK_PRICE = 8;
    public static final double TWO_DIFFERENT_BOOKS_DISCOUNT = 0.05;
    public static final double THREE_DIFFERENT_BOOKS_DISCOUNT = 0.10;
    public static final double FOUR_DIFFERENT_BOOKS_DISCOUNT = 0.20;
    public static final double FIVE_DIFFERENT_BOOKS_DISCOUNT = 0.25;
    public static final HashMap<Integer, Double> DIFFERENT_BOOKS_DISCOUNT = new HashMap<>();

    private List<BookOfPotter> books = new ArrayList<>();

    static {
        DIFFERENT_BOOKS_DISCOUNT.put(2, TWO_DIFFERENT_BOOKS_DISCOUNT);
        DIFFERENT_BOOKS_DISCOUNT.put(3, THREE_DIFFERENT_BOOKS_DISCOUNT);
        DIFFERENT_BOOKS_DISCOUNT.put(4, FOUR_DIFFERENT_BOOKS_DISCOUNT);
        DIFFERENT_BOOKS_DISCOUNT.put(5, FIVE_DIFFERENT_BOOKS_DISCOUNT);
    }

    public double checkout() {
        List<Integer> discountStrategy = getDiscountStrategy();

        return calculateDiscountSubtotal(discountStrategy) + noDiscountSubtotal(books.size());
	}

    private void optimizeStrategy(List<Integer> discountStrategy) {
        while (discountStrategy.contains(5) && discountStrategy.contains(3)){
            discountStrategy.remove(new Integer(5));
            discountStrategy.remove(new Integer(3));
            discountStrategy.add(4);
            discountStrategy.add(4);
        }
    }

    private double calculateDiscountSubtotal(List<Integer> discountStrategy) {
        double subtotal = 0;
        for(int uniqueBooksCount : discountStrategy){
            subtotal += discountSubtotal(uniqueBooksCount);
        }
        return subtotal;
    }

    private List<Integer> getDiscountStrategy() {
        List<Integer> discountStrategy = new ArrayList<>();
        while (differentBooksCount() > 1){
            discountStrategy.add(differentBooksCount());
            removeDifferentBooksOnce();
        }

        optimizeStrategy(discountStrategy);

        return discountStrategy;
    }

    private void removeDifferentBooksOnce() {
        for(BookOfPotter book : allUniqueBooks()){
            books.remove(book);
        }
    }

    private HashSet<BookOfPotter> allUniqueBooks() {
        return new HashSet<>(books);
    }

    private double discountSubtotal(int differentBooksCount) {
        return noDiscountSubtotal(differentBooksCount) * (1 - DIFFERENT_BOOKS_DISCOUNT.get(differentBooksCount));
    }

    private int noDiscountSubtotal(int booksCount) {
        return SINGLE_BOOK_PRICE * booksCount;
    }

    public void addBook(BookOfPotter book) {
        books.add(book);
	}

    private int differentBooksCount(){
        return allUniqueBooks().size();
    }
}
