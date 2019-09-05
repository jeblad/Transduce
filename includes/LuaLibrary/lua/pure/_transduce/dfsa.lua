-- don't pollute with globals
require('Module:No globals')

local SINGLE = 1
local MULTIPLE = 2
local ALTERNATE = 4

local dfsa = {}

function dfsa.next( index, current, tape, transitions )
	if not current then
		return nil
	elseif transitions[current] == true then
		return true
	elseif transitions[current][1] == SINGLE then
		return mw.ustring.sub(tape, index, index) == transitions[current][3] and transitions[current][2] or nil
	elseif transitions[current][1] == MULTIPLE then
		for _,transition in ipairs( transitions[current][2] ) do
			if mw.ustring.sub(tape, index, index) == transition[2] then
				return transition[1]
			end
		end
		return nil
	end
	return nil, 'Wrong state transfer type'
end

--- drecognize
function dfsa.eval( tape, transitions )
	local index = 1
	local current = 1
	local tapeLength = mw.ustring.len( tape )

	repeat
		if index > tapeLength then
			local lookahead = dfsa.next( index, current, tape, transitions )
			return (lookahead == true) and true or false
		elseif not current then
			return false
		else
			current = dfsa.next( index, current, tape, transitions )
			index = index+1
		end
	until false
end

return dfsa
