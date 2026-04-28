public static class SquareRoot
{
    public static int Root(int number)
    {
        int i = 0;
        while (i * i != number)
        {
            i++;
        }
        return i;
    }
}
