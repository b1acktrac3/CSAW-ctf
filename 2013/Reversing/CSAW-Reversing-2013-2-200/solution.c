#include <stdio.h>

int ciphertext[] = {0xE9F5CCBB, 0xFDF7D1DC, 0xFAFCC8D6, 0xE9EAC389, 0xFCEDC3D7, 0xE1FBCFD7, 0xFAF8C2CF, 0xB2EBCFDF, 0x8899D7CB, 0x8899AABB};

void reverse()
{
	char *c_cipher3 = (char *)(&ciphertext);
	int index = 0;

	do 
	{
		*((int *)ciphertext + index++) ^= 0x8899AABB;
	} while (index < 10);

	printf("%s\r\n", c_cipher3 + 1);
}

int main()
{
	reverse();
	return 0;
}