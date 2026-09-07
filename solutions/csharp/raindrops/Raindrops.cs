public static class Raindrops
{
    public static string Convert(int number)
    {
        string sound = "";

        if (number % 3 == 0) sound += "Pling";
        if (number % 5 == 0) sound += "Plang";
        if (number % 7 == 0) sound += "Plong";

        if (sound == "")
            return number.ToString();
        else
            return sound;
    }
}