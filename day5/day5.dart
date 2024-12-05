import 'dart:io';

bool is_valid(List<String> line, Map<dynamic, dynamic> rules) {
	var visited = [];

	for (var item in line) {
		if (rules.containsKey(item)) {
			for (var i in rules[item]) {
				if (visited.contains(i)) {
					return false;
				}
			}
		}
		visited.add(item);
	}

	return true;
}

int part1(List<List<String>> lines, Map<dynamic, dynamic> rules) {
	int total = 0;

	for (var line in lines) {
		if (is_valid(line, rules)) {
			total += int.parse(line[(line.length / 2).floor()]);
		}
	}

	return total;
}

int countRelevantRules(List<String> line, List<dynamic> rules) {
	int count = 0;

	for (var item in rules) {
		if (line.contains(item)) {
			count++;
		}
	}

	return count;
}

int part2(List<List<String>> lines, Map<dynamic, dynamic> rules) {
	int total = 0;
	
	for (var line in lines) {
		if (is_valid(line, rules)) {
			continue;
		}

		line.sort((a, b) =>
			-countRelevantRules(line, rules.containsKey(a) ? rules[a] : []) +
			countRelevantRules(line, rules.containsKey(b) ? rules[b] : []));

		total += int.parse(line[(line.length / 2).floor()]);
	}

	return total;
}

void main() {
	File file = File("input.txt");
	var content = file.readAsStringSync();

	var [rules, lines] = content
		.split("\n\n")
		.map((e) => e.split("\n"))
		.toList();
	
	var rules_dict = {};

	for (var item in rules) {
		var [i1, i2] = item.split("|");

		if (!rules_dict.containsKey(i1)) {
			rules_dict[i1] = [];
		}

		rules_dict[i1].add(i2);
	}

	var parsed_lines = lines.map((e) => e.split(",")).toList();

	print("Part 1: " + part1(parsed_lines, rules_dict).toString());
	print("Part 2: " + part2(parsed_lines, rules_dict).toString());
}