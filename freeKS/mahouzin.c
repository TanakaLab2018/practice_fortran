#include <stdio.h>
#include <string.h>

int main() {
	int n = 9, i = 4, j = 0, k = 1;
	int d[9][9] = { 0 };

	d[i][j] = k;
	for (k = 2; k < n * n + 1; k++) {
		if (j == 0) {
			if (i > 0 && d[i - 1][n - 1] == 0) {
				d[i - 1][n - 1] = k;
				i--;
				j = n - 1;
			} else {
				d[i][j + 1] = k;
				j++;
			}
		} else if (i == 0) {
			if (d[n - 1][j - 1] == 0) {
				d[n - 1][j - 1] = k;
				i = n - 1;
				j--;
			} else {
				d[i][j + 1] = k;
				j++;
			}
		} else if (d[i - 1][j - 1] == 0) {
			d[i - 1][j - 1] = k;
			i--;
			j--;
		} else {
			d[i][j + 1] = k;
			j++;
		}
	}
	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			printf("%3d", d[i][j]);
		}
		printf("\n");
	}
}
