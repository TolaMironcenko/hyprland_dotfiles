#include <stdio.h>
#include <string.h>

#include "../slstatus.h"
#include "../util.h"

#define WTTR_TEMP "/tmp/wttr"

const char *weather()
{
	FILE *wttr = fopen(WTTR_TEMP, "r");
	char temp[10];
	memset(&temp, '\0', 10);

	fgets(temp, 10, wttr);
	fclose(wttr);

	temp[strlen(temp)-1] = '\0';

	return bprintf("%s", temp);
}
