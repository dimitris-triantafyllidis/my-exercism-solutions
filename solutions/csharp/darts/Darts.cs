public static class Darts
{
    public static double DistanceFromCenter(double x, double y)
    {
        return Math.Sqrt(x * x + y * y);
    }
    public static int Score(double x, double y)
    {
        switch (DistanceFromCenter(x, y))
        {
            case <= 1:
                return 10;
            case <= 5:
                return 5;
            case <= 10:
                return 1;
            default:
                return 0;
        }
    }
}
