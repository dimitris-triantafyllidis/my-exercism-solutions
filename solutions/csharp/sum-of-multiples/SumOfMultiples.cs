public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max)
    {
        List<int> multiples_list = [];
        foreach (int base_value in multiples)
        {
            if (base_value == 0)
            {
                multiples_list.Add(0);
                continue;
            }
            int multiple = base_value;
            while(multiple < max)
            {
                multiples_list.Add(multiple);
                multiple += base_value;
            }
        }
        return multiples_list.Distinct().Sum();
    }
}