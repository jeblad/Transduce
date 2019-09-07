return {
	label = 'DFSA for Sheeptalk, ref Speech and Language Processing, page 62',
	type = 'dfsa',
	--  first is a string used as a label, or a list
	--  second is a number pointing to a state
	transitions = {
		-- state 0
		{ 'b', 2 },
		-- state 1
		{ 'a', 3 },
		-- state 2
		{ 'a', 4 },
		-- state 3
		{
			{ 'a', 4 },
			{ '!', 5 },
		},
		{}
	}
}