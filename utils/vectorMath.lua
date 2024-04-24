local M = {}

local function dot(a, b)
	local sum = 0
	for i = 1, #a do
		sum = sum + a[i] * b[i]
	end
	return sum
end

local function cross(a, b)
	local sum = 0
	for i = 1, #a do
		sum = sum + a[i] * b[i]
	end
	return sum
end

local function multiply(a, b)
	local sum = {}
	for i = 1, #a do
		sum[i] = a[i] * b[i]
	end
	return sum
end

M.multiply = multiply
M.cross = cross
M.dot = dot
return M
