用Reflector查看，可以看到与当前的时间的hour有关，用get_str.c中的代码生成。这题有bug，在某些环境配置下得不到正确答案。最后还是去IRC中找官方的人员问了以后才拿到答案。

####比较的代码
       private void eval_ᜀ(object obj, EventArgs eventArg)
        {
            string str = null;
            Assembly executingAssembly = Assembly.GetExecutingAssembly();
            ResourceManager resourceManager = new ResourceManager(string.Concat(executingAssembly.GetName().Name, ".Resources"), executingAssembly);
            DateTime now = DateTime.Now;
            string text = this.eval_ᜀ.Text;
            string str1 = string.Format("{0}", now.Hour + 1);  
            this.eval_ᜀ("NeEd_MoRe_Bawlz", Convert.ToInt32(str1), ref str);  <---根据hour生成字符串
            if (string.Compare(text.ToUpper(), str) != 0)
            {
                this.eval_ᜃ.Image = (Bitmap)resourceManager.GetObject("Almost There");
                this.eval_ᜀ();
            }
            else
            {
                this.eval_ᜂ.Text = "";
                Form1 form1 = this;
                form1.eval_ᜀ(form1.eval_ᜀ(107));
                this.eval_ᜁ();
                this.eval_ᜂ.Text = string.Format(this.eval_ᜂ.Text, this.eval_ᜀ(resourceManager));
                this.eval_ᜃ.Image = (Bitmap)resourceManager.GetObject("Sorry You Suck");
            }
        }

####生成字符串的代码如下
		private void eval_ᜀ(string str, int num, ref string strPointers)
        {
            int num1 = 0;
            if (0 < str.Length)
            {
                do
                {
                    char chr = str[num1];
                    int num2 = 1;
                    if (1 < num)
                    {
                        do
                        {
                            chr = Convert.ToChar(this.eval_ᜀ(Convert.ToInt32(chr), num2));
                            num2++;
                        }
                        while (num2 < num);
                    }
                    strPointers = string.Concat(strPointers, chr);
                    num1++;
                }
                while (num1 < str.Length);
            }
            strPointers = this.eval_ᜀ(strPointers);
        }
