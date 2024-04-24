local M = {}

local function dot(a, b)
	local sum = 0
	for i = 1, #a do
		sum = sum + a[i] * b[i]
	end
	return sum
end

M.dot = dot
return M
