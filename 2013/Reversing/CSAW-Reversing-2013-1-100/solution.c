#include <stdio.h>

int ciphertext[] = {0xABBC8299, 0xa5b59a84, 0xbfb4df8c, 0xb8b89c8f, 0xadb8978b, 0xe5e7978c, 0xccddee82, 0xccddeeff, 0};

void reverse()
{
	int length ;
	int index = 0;
	char *c_cipher = (char *)(&ciphertext);

	length = strlen(c_cipher);
	if (length >> 2 != -1)
	{	
		do 
		{
			*(int *)&cipher[index++] ^= 0xCCDDEEFF;
		} while (index < (length >> 2) + 1);
	}

	printf("%s\r\n", c_cipher);
}

int main()
{
	reverse();
	return 0;
}