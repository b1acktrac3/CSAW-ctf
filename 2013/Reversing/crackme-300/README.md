IDA反汇编，将输入的字符串进行处理后，与0xEF2E3558对比，相等即可。这题是手工二分法尝试，一个答案是“7620(&b”

    signed int __cdecl sub_8048EA0(unsigned __int8 *a1)  <---a1是输入的字符串
    {
      int v1; // ST0C_4@3
      unsigned __int8 v3; // [sp+3h] [bp-Dh]@1
      signed int v4; // [sp+4h] [bp-Ch]@1
      unsigned __int8 *v5; // [sp+8h] [bp-8h]@2

      v3 = *a1;
      v4 = 1337;
      if ( *a1 )
      {
        v5 = a1;
        do
        {
          v1 = 32 * v4 + v3;
          v3 = (v5++)[1];
          v4 += v1;
        }
        while ( v3 );
      }
      return v4;
    }