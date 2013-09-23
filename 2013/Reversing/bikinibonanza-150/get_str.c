#include <stdio.h>
#include <string.h>

int numArray[] = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113};
char *text = "NeEd_MoRe_Bawlz";
char get_char(char chr, int index)
{
	return numArray[index] ^ chr;
}

void get_str(int hour)
{
	int index = 0;
	char buf[255];
	int length = strlen(text);

	memset(buf, 0, 255);

	if (0 < length)
	{
		do
		{
			char chr = text[index];
			int num2 = 1;
			if (1 < hour)
			{
				do
				{
					chr = get_char(chr, num2);
					num2++;
				}
				while (num2 < hour);
			}
			buf[index] = chr;
			index++;
		}
		while (index < length);
	}

	printf("%02d: %s\n", hour, buf);
}

int main()
{
	int hour;
	for (hour = 0; hour < 24; hour++)
	{
		get_str(hour + 1);
	}
	return 0;
}