return {
	label = 'DFSA for Sheeptalk, ref Speech and Language Processing, page 62',
	type = 'dfsa',
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
		{ 1, 4, 'a' },
		-- state 3
		{ 2, {
			{ 4, 'a'},
			{ 5, '!'}
			}
		},
		true
	}
}