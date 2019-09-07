local dfsa = {}

function dfsa.next( index, state, tape, engine )
	local node = engine[state]
	if not node then
		return false
	end
	if node[1] == nil then
		return true
	end
	local subType = type( node[1] )
	if subType == 'string' then
		return mw.ustring.sub( tape, index, index ) == node[1] and node[2] or false
	end
	if subType == 'table' then
		for _,v in ipairs( node ) do
			if mw.ustring.sub(tape, index, index) == v[1] then
				return v[2]
			end
		end
		return false
	end
	return nil, 'Wrong type of engine transition'
end

--- drecognize
function dfsa.recognize( tape, engine )
	local index = 1 -- pointer to code point on tape
	local state = 1 -- pointer to state of engine
	local tapeLength = mw.ustring.len( tape )

	repeat
		-- out of tape
		if index > tapeLength then
			state = dfsa.next( index, state, tape, engine )
			return (state == true) -- accept on existing lookahead, reject otherwise
		elseif not state then
			return false -- reject on failing engine state
		else
			state = dfsa.next( index, state, tape, engine )
			index = index+1
		end
	until false
end

return dfsa
