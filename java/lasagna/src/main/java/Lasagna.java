public class Lasagna {
    public int expectedMinutesInOven() {
        return 40;
    }

    public int remainingMinutesInOven(int actualMinutesInOven) {
        return expectedMinutesInOven() - actualMinutesInOven;
    }

    public int preparationTimeInMinutes(int numLayers) {
        return numLayers * 2;
    }

    public int totalTimeInMinutes(int numLayers, int actualMinutesInOven) {
        return numLayers * 2 + actualMinutesInOven;
    }
}
