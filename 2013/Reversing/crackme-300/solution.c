#include <stdio.h>

void reverse(/*unsigned char *input*/)
{
	//int v4 = 1337;
	int v1;
	unsigned char *v5;
	unsigned char v3;
	unsigned char input[255];

	while (1)
	{
		scanf("%s", input);

		v5 = input;
		v3 = *v5;
		int v4 = 1337;
		do 
		{
			v1 = 32 * v4 + v3;
			v3 = (v5++)[1];
			v4 += v1;
		} while (v3);

		printf("%08X\r\n", (unsigned int)v4);

		if (v4 == 0xEF2E3558)
		{
			printf("Got it\r\n");
			break;
		}
	}
}

int main()
{
	reverse();
	return 0;
};