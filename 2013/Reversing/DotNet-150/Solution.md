    .method private static hidebysig void Main(string[] args)
  
        .entrypoint
        .maxstack 3
        .locals init (string V0,
                      int64 V1,
                      int64 V2,
                      int64 V3,
                      unsigned int8[] V4,
                      unsigned int8[] V5,
                      string V6,
                      class [mscorlib]System.Exception V7,
                      bool V8)
        nop
        ldstr    "Greetings challenger! Step right up and try your shot at gaining the flag!"
        call     void [mscorlib]System.Console::WriteLine(string)
        nop
        ldstr    "You'll have to know the pascode to unlock the prize:"
        call     void [mscorlib]System.Console::WriteLine(string)
        nop
        call     string [mscorlib]System.Console::ReadLine()
        stloc.0
        ldloc.0
        call     int64 [mscorlib]System.Convert::ToInt64(string)    <----读取输入的数字
        stloc.1
        ldc.i8   0xC5EC4D790           
        stloc.2
        ldc.i8   0xF423ABDB7
        stloc.3
        ldloc.1
        ldloc.2   
        xor      
        ldloc.3  
        ceq      <---- 输入的数字与0xC5EDC4D790异或，要等于0xF423ABDB7。答案就是0xC5EC4D790 ^ 0xF423ABDB7 = 13371337255
        ldc.i4.0     
        ceq
        stloc.s  8
        ldloc.s  8
        brtrue.s loc_64      
        ldstr    "yay"
        call     void [mscorlib]System.Console::WriteLine(string)
        nop
        br.s     loc_6F

        loc_64:                                 
            ldstr    "Incorrect, try again!"
            call     void [mscorlib]System.Console::WriteLine(string)
            nop