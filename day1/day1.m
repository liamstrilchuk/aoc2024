format longG

fileid = fopen("input.txt", "r");
all_nums = fscanf(fileid, "%d");

A = all_nums(1:2:end);
B = all_nums(2:2:end);

A_sorted = sort(A);
B_sorted = sort(B);

part1 = 0;

for i = 1:length(A)
	part1 = part1 + abs(A_sorted(i) - B_sorted(i));
end

fprintf("Part 1: ");
disp(part1);

part2 = 0;

for i = 1:length(A)
	part2 = part2 + A(i) * sum(B == A(i));
end

fprintf("Part 2: ");
disp(part2);