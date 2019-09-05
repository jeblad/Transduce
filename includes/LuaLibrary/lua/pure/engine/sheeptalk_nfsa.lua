return {
	label = 'NFSA for Sheeptalk, ref Speech and Language Processing, page 67',
	type = 'nfsa',
	--  first is type of structure
	--  second is a number or list, ref type in first
	--  third is the input string
	--  fourth might be a label
	transitions = {
		-- state 0
		{ 1, 2, 'b' },
		-- state 1
		{ 1, 3, 'a' },
		-- state 2
		{ 4, {3, 4}, 'a' },
		-- state 3
		{ 1, 5, '!' },
		-- state 4
		true
	}
}