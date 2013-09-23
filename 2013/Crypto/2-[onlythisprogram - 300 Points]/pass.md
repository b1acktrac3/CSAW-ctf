#[onlythisprogram.py](https://github.com/b1acktrac3/CSAW-ctf/blob/master/2013/Crypto/2-%5Bonlythisprogram%20-%20300%20Points%5D/onlythisprogram/onlythisprogram.py)
原包中给的加密算法，很简单，block亦或加密，长度为256

#解密原理
###亦或
	A^B=C => A^C=B
###文件特性
	文件出现概率最大的字符为0x00（二进制）或）0x20（文本文件）
#解密过程
	由于知道block长度为256，所以文件中没隔256个字符，所用的加密pad是一样的。
	
[replace.py](https://github.com/b1acktrac3/CSAW-ctf/blob/master/2013/Crypto/2-%5Bonlythisprogram%20-%20300%20Points%5D/onlythisprogram/replace.py)
将加密后的文件数据重新整理，简单来说用同一个pad亦或的数据放在相同的文件中。整理后的文件保存在[replace](https://github.com/b1acktrac3/CSAW-ctf/tree/master/2013/Crypto/2-%5Bonlythisprogram%20-%20300%20Points%5D/onlythisprogram/replace)文件夹中。比如说0.rec文件中都是用pad[0]亦或得来的数据。

[dec.py](https://github.com/b1acktrac3/CSAW-ctf/blob/master/2013/Crypto/2-%5Bonlythisprogram%20-%20300%20Points%5D/onlythisprogram/dec.py)
解密脚本，分别计算[replace]()包中出现最多的字节，然后猜想其原字节为0x00或0x20，分别与0x00或0x20亦或得出两个pad串。分别用两个pad串将[output](https://github.com/b1acktrac3/CSAW-ctf/tree/master/2013/Crypto/2-%5Bonlythisprogram%20-%20300%20Points%5D/onlythisprogram/output)中各个文件亦或解密，结果分别保存在[enc00](https://github.com/b1acktrac3/CSAW-ctf/tree/master/2013/Crypto/2-%5Bonlythisprogram%20-%20300%20Points%5D/onlythisprogram/enc00)，[enc20](https://github.com/b1acktrac3/CSAW-ctf/tree/master/2013/Crypto/2-%5Bonlythisprogram%20-%20300%20Points%5D/onlythisprogram/enc20)中。在用“file”命令判断下哪个文件夹下是可识别的文件，得出enc00中的是，根据“file”命令的判断，修改文件名，结果在[rename](https://github.com/b1acktrac3/CSAW-ctf/tree/master/2013/Crypto/2-%5Bonlythisprogram%20-%20300%20Points%5D/onlythisprogram/rename)中。这些文件都是可读的了。

#寻找key
key就在这几个文件里，由于online不online了，没有找。