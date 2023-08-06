import java.util.AbstractMap;
import java.util.Map;

public class Blackjack {
    private static String WIN = "W";
    private static String STAND = "S";
    private static String SPLIT = "P";
    private static String HIT = "H";

    private static Map<String, Integer> cardScores = Map.ofEntries(
            Map.entry("ace", 11),
            Map.entry("two", 2),
            Map.entry("three", 3),
            Map.entry("four", 4),
            Map.entry("five", 5),
            Map.entry("six", 6),
            Map.entry("seven", 7),
            Map.entry("eight", 8),
            Map.entry("nine", 9),
            Map.entry("ten", 10),
            Map.entry("jack", 10),
            Map.entry("queen", 10),
            Map.entry("king", 10));

    public int parseCard(String card) {
        return cardScores.get(card);
    }

    public boolean isBlackjack(String card1, String card2) {
        return parseCard(card1) + parseCard(card2) == 21;
    }

    public String largeHand(boolean isBlackjack, int dealerScore) {
        var hasDoubleAces = !isBlackjack;
        if (hasDoubleAces) {
            return SPLIT;
        }

        var dealerHasAnAce = dealerScore == aceScore();
        if (isBlackjack && !dealerHasAnAce && dealerScore != 10) {
            return WIN;
        }

        return STAND;
    }

    public String smallHand(int handScore, int dealerScore) {
        if (handScore >= 17) {
            return STAND;
        }

        if (handScore <= 11 || dealerScore >= 7) {
            return HIT;
        }

        return STAND;
    }

    // FirstTurn returns the semi-optimal decision for the first turn, given the
    // cards of the player and the dealer.
    // This function is already implemented and does not need to be edited. It pulls
    // the other functions together in a
    // complete decision tree for the first turn.
    public String firstTurn(String card1, String card2, String dealerCard) {
        int handScore = parseCard(card1) + parseCard(card2);
        int dealerScore = parseCard(dealerCard);

        if (20 < handScore) {
            return largeHand(isBlackjack(card1, card2), dealerScore);
        } else {
            return smallHand(handScore, dealerScore);
        }
    }

    private int aceScore() {
        return parseCard("ace");
    }
}
