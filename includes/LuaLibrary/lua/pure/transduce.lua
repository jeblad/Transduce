--- Class for Transduce.
-- This class follows the pattern from
-- [Lua classes](../topics/lua-classes.md.html).
-- @classmod Transduce
-- @author John Erling Blad < jeblad@gmail.com >

-- @table exported class variable
local Transduce = {}

-- @table local library variable
local libUtil = require 'libraryUtil'

--- Create a new instance.
-- @raise on wrong arguments type, unless turned off by @{Transduce.typeCheck}.
-- @tparam vararg ... forwarded to `_init()`
-- @treturn self
function Transduce:create( ... )
	if Transduce.typeCheck then
		for i,v in ipairs( { ... } ) do
			libUtil.checkTypeMulti( 'Transduce:create', i, v, { 'string', 'boolean', 'table', 'function' } )
		end
	end
	local meta = rawget( self, 'create' ) and self or getmetatable( self )
	local new = setmetatable( {}, meta )
	return new:_init( ... )
end

function Transduce:load( name )
	if Transduce.typeCheck then
		libUtil.checkType( 'Transduce:load', 1, name, 'string', false )
	end
	self.engine = mw.loadData( name )
	if not self.engine then
		return nil, 'No engine'
	end
	self.parser = require( string.format( '_transduce.%s', self.engine.type ) )
	if not self.parser then
		return nil, 'No parser'
	end
	return self
end

function Transduce:eval( tape )
	if not self.engine then
		return nil, 'No engine'
	end
	if not self.engine or not self.parser then
		return nil, 'No parser'
	end
	local result = self.parser.eval( tape, self.engine.transitions )
	if type( result ) == 'nil' then
		return nil, 'Parser failed'
	end
	return result
end

return Transduce