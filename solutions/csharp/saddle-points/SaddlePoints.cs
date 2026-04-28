public static class SaddlePoints
{
    public static IEnumerable<(int, int)> Calculate(int[,] matrix)
    {
        var candidates = new List<(int, int)>();
        for (int i = 0; i < matrix.GetLength(0); i++)
        {
            var row_max = Enumerable.Range(0, matrix.GetLength(1)).Max(c => matrix[i, c]);
            for (int j = 0; j < matrix.GetLength(1); j++)
            {
                var column_min = Enumerable.Range(0, matrix.GetLength(0)).Min(c => matrix[c, j]);
                if (matrix[i, j] == row_max && matrix[i, j] == column_min)
                {
                    candidates.Add((i + 1, j + 1));
                }
            }
        }
        return candidates;
    }
}
