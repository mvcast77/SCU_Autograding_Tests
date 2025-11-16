/* Test File for behavior testing */

//  includes
#include	<stdlib.h>
#include	<stdio.h>
#include	<string.h>

#define MAX_LENGTH 20

int main (void) {
	int option;
	char buffer[MAX_LENGTH];

	while (1) {
		printf ("enter option ('exit' to quite)\n");
		if (scanf("%s", buffer) != 1) {
			printf("failure in scanning\n");
			exit(1);
		}

		if (strcmp(buffer, "exit") == 0) break;

		char * final = strdup(buffer);
		printf("String is %s\n", final);
		free(final);
	}	
}
