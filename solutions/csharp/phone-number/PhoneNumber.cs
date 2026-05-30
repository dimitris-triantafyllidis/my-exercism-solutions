public class PhoneNumber
{
    public static string Clean(string phoneNumber)
    {
        var f = new string([.. phoneNumber.Where(char.IsDigit)]);

        if (f.Length == 10 &&
            (f[0] - '0' >= 2 ) &&
            (f[0] - '0' <= 9 ) &&
            (f[3] - '0' >= 2 ) &&
            (f[3] - '0' <= 9 )
        )
        {
            return f;
        }
        else if (f.Length == 11 &&
            f[0] == '1' &&
            (f[1] - '0' >= 2 ) &&
            (f[1] - '0' <= 9 ) &&
            (f[4] - '0' >= 2 ) &&
            (f[4] - '0' <= 9 )
        )
        {
            return f.Substring(1, 10);
        }
        else
        {
            throw new ArgumentException("");
        }
    }
}