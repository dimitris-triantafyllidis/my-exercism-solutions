using System.Runtime.Serialization;

[Flags]
enum AccountType : byte
{
    Guest = 0x01,
    User  = 0x02,
    Moderator = 0x04
}

[Flags]
enum Permission : byte
{
    Read = 0x01,
    Write = 0x02,
    Delete = 0x04,
    All = Read | Write | Delete,
    None = 0x00
}

static class Permissions
{
    public static Permission Default(AccountType accountType)
    {
        return accountType switch
        {
            AccountType.Guest => Permission.Read,
            AccountType.User => Permission.Read | Permission.Write,
            AccountType.Moderator => Permission.All,
            _ => Permission.None
        };
    }

    public static Permission Grant(Permission current, Permission grant)
    {
        return current | grant;
    }

    public static Permission Revoke(Permission current, Permission revoke)
    {
        return current & (Permission)(Permission.All - revoke);
    }

    public static bool Check(Permission current, Permission check)
    {
        return (current & check) == check;
    }
}
