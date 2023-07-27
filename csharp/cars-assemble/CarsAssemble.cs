using System;

static class AssemblyLine
{
    static readonly int LOWEST_SPEED_PRODUCTION_RATE_PER_HOUR = 221;

    public static double SuccessRate(int speed) =>
        speed switch
        {
            0 => 0,
            <= 4 => 1,
            <= 8 => 0.9,
            9 => 0.8,
            10 => 0.77,
            _ => throw new ArgumentOutOfRangeException(),
        };

    public static double ProductionRatePerHour(int speed) =>
        ProductionRatePerHourNoFaulty(speed) * SuccessRate(speed);

    public static int WorkingItemsPerMinute(int speed) =>
        (int)Math.Floor(ProductionRatePerHour(speed) / 60);

    private static int ProductionRatePerHourNoFaulty(int speed) =>
        LOWEST_SPEED_PRODUCTION_RATE_PER_HOUR * speed;
}
