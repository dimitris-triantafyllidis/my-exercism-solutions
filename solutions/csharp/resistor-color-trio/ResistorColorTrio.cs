public static class ResistorColorTrio
{
    private static readonly Dictionary<string, int> ColorCodes =
        new Dictionary<string, int> {
            ["black"]  = 0,
            ["brown"]  = 1,
            ["red"]    = 2,
            ["orange"] = 3,
            ["yellow"] = 4,
            ["green"]  = 5,
            ["blue"]   = 6,
            ["violet"] = 7,
            ["grey"]   = 8,
            ["white"]  = 9
        };

    public static string Label(string[] colors)
    {
        long ohmValue =
            (10 * ColorCodes[colors[0]] + ColorCodes[colors[1]])
            * (long)Math.Pow(10, ColorCodes[colors[2]]);

        int digitCount = ohmValue.ToString().Length;

        string prefix =
            digitCount < 4  ? ""     :
            digitCount < 7  ? "kilo" :
            digitCount < 10 ? "mega" :
                              "giga";

        int scale = 3 * ((digitCount - 1) / 3);
        double scaled = ohmValue / Math.Pow(10, scale);

        string scaledStr = scaled.ToString().Replace(".0", "");

        return $"{scaledStr} {prefix}ohms";
    }
}
