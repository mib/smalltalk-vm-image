command line
displayHelp
	Transcript
		show: 'Grep - pattern matcher/filter'; cr; cr;
		show: 'Usage: grep [OPTIONS] PATTERN [INPUT-FILE [OUTPUT-FILE]]'; cr;
		show: '       grep [OPTIONS] -e PATTERN [-e PATTERN2...] [INPUT-FILE [OUTPUT-FILE]]'; cr;
		show: '       grep [OPTIONS] -f PATTERN-FILE [INPUT-FILE [OUTPUT-FILE]]'; cr; cr;
		show: 'Options:'; cr;
		show: '    -h    display this help and exit'; cr;
		show: '    -i    case-insensitive matching'; cr;
		show: '    -v    invert matching (print non-matching lines)'; cr;
		show: '    -c    suppress normal output, print the number of matches instead'; cr;
		show: '    -x    match exactly the whole line'; cr;
		show: '    -e PATTERN'; cr;
		show: '          use PATTERN as a pattern; this can be used to specify multiple'; cr;
		show: '          patterns'; cr;
		show: '    -f PATTERN-FILE'; cr;
		show: '          load patterns from PATTERN-FILE, one per line; empty lines are ignored'; cr; cr;
		show: 'If INPUT-FILE and OUTPUT-FILE are omitted or specified as "-", then stdin and stdout are used.'; cr