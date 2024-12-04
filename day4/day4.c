#include <stdio.h>
#include <string.h>

const int GRID_SIZE = 140;

typedef char grid_t[140][140];

int part1(grid_t *grid) {
	int count = 0;

	for (int row = 0; row < GRID_SIZE; row++) {
		for (int col = 0; col < GRID_SIZE; col++) {
			if (col < GRID_SIZE - 3) {
				char to_right[4] = {(*grid)[row][col], (*grid)[row][col + 1], (*grid)[row][col + 2], (*grid)[row][col + 3]};
				if (strcmp(to_right, "XMAS") == 0 || strcmp(to_right, "SAMX") == 0) {
					count++;
				}
			}

			if (row < GRID_SIZE - 3) {
				char to_bottom[4] = {(*grid)[row][col], (*grid)[row + 1][col], (*grid)[row + 2][col], (*grid)[row + 3][col]};
				if (strcmp(to_bottom, "XMAS") == 0 || strcmp(to_bottom, "SAMX") == 0) {
					count++;
				}
			}

			if (col < GRID_SIZE - 3 && row < GRID_SIZE - 3) {
				char to_br[4] = {(*grid)[row][col], (*grid)[row + 1][col + 1], (*grid)[row + 2][col + 2], (*grid)[row + 3][col + 3]};
				if (strcmp(to_br, "XMAS") == 0 || strcmp(to_br, "SAMX") == 0) {
					count++;
				}
			}

			if (col > 2 && row < GRID_SIZE - 3) {
				char to_bl[4] = {(*grid)[row][col], (*grid)[row + 1][col - 1], (*grid)[row + 2][col - 2], (*grid)[row + 3][col - 3]};
				if (strcmp(to_bl, "XMAS") == 0 || strcmp(to_bl, "SAMX") == 0) {
					count++;
				}
			}
		}
	}

	return count;
}

int part2(grid_t *grid) {
	int count = 0;

	for (int row = 1; row < GRID_SIZE - 1; row++) {
		for (int col = 1; col < GRID_SIZE - 1; col++) {
			char diag1[] = {(*grid)[row - 1][col - 1], (*grid)[row][col], (*grid)[row + 1][col + 1], '\0'};
			char diag2[] = {(*grid)[row - 1][col + 1], (*grid)[row][col], (*grid)[row + 1][col - 1], '\0'};

			if ((strcmp(diag1, "MAS") == 0 || strcmp(diag1, "SAM") == 0) && (strcmp(diag2, "MAS") == 0 || strcmp(diag2, "SAM") == 0)) {
				count++;
			}
		}
	}
	
	return count;
}

int main() {
	grid_t grid;

	FILE *fptr = fopen("input.txt", "r");
	char line[GRID_SIZE + 2];

	int row = 0;
	while (fgets(line, GRID_SIZE + 2, fptr)) {
		for (int i = 0; i < GRID_SIZE; i++) {
			grid[row][i] = line[i];
		}
		row++;
	}

	printf("Part 1: %d\n", part1(&grid));
	printf("Part 2: %d\n", part2(&grid));

	fclose(fptr);

	return 0;
}