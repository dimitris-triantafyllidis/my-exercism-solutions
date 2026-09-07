using System.Collections;
using System.Diagnostics.CodeAnalysis;

public static class TelemetryBuffer
{
    public static byte[] ToBuffer(long reading)
    {
        byte[] buffer = new byte[9];

        buffer[0] = reading switch
        {
            long r when r >= 4_294_967_296              && r <= 9_223_372_036_854_775_807 => 248,
            long r when r >= 2_147_483_648              && r <= 4_294_967_295             => 4,
            long r when r >= 65_536                     && r <=  2_147_483_647            => 252,
            long r when r >= 0                          && r <= 65_535                    => 2,
            long r when r >= -32_768                    && r <= -1                        => 254,
            long r when r >= -2_147_483_648             && r <= -32_769                   => 252,
            long r when r >= -9_223_372_036_854_775_808 && r <= -2_147_483_649            => 248,
            _ => 0
        };

        long byte_count = buffer[0] <= 4 ? buffer[0] : 256 - buffer[0];

        for ( long i = 0; i < byte_count; i++ )
        {
            buffer[i + 1] = (byte)((reading >>> (byte)(8 * i)) & 0xFF);
        }

        return buffer;
    }

    public static long FromBuffer(byte[] buffer)
    {
        long reading = 0;

        if (buffer[0] <= 4)
        {
            for ( long i = 1; i < 9; i++ )
            {
                reading <<= 8;
                reading |= buffer[9 - i];
            }
        }
        else if (buffer[0] >= 248)
        {
            int byte_count = 256 - buffer[0];
            long i = 0;
            for ( i = 1; i < 9; i++ )
            {
                reading <<= 8;
                reading |= buffer[9 - i];
            }
            if (byte_count < 8)
            {
            if ((buffer[byte_count] & 0x80) == 0x80)
            {
                reading |= -1L << (8 * byte_count);
            }
            }
        }

        return reading;
    }
}
