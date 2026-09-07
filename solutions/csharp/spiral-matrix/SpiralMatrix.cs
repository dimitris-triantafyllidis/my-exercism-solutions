public class SpiralMatrix
{
    public static int[,] GetMatrix(int n)
    {

        var m = new int[n, n];

        int runCount  = 0;
        int runLength = n;
        int direction  = 0;

        int step = 1;
        int runStep = 1;

        int cursor_row    = 1;
        int cursor_column = 1;

        while (step <= n * n)
        {
            if (runStep == runLength)
            {
                runStep = 1;
                runCount += 1;
                runLength = n - (runCount - 1) / 2;
            }

            m[cursor_row - 1, cursor_column - 1] = step;
            direction = runCount % 4;

            if (direction == 0)
                cursor_column += 1;
            else if (direction == 1)
                cursor_row += 1;
            else if (direction == 2)
                cursor_column -= 1;
            else if (direction == 3)
                cursor_row -= 1;

            step += 1;
            runStep += 1;
        }

        return m;
    }
}
