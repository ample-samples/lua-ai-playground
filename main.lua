local matrix = require "utils/matrix"
local utils = require "utils/utils"
-- local STP = require "StackTracePlus"
-- debug.traceback = STP.stracktrace

-- print(batchCalculateLayerOutput())

-- print("scalar . 1d vector")
-- print(matrix.dot(scalar, v1))
--
-- print("scalar . 2d vector")
-- print(matrix.dot(scalar, v2))
--
-- print("1d vector . 1d vector")
-- print(matrix.dot(v1, v11))
--
-- print("1d vector . 2d vector")
-- print(matrix.dot(v1, v2))
--

-- tests

local function addBiases(layerOutput, layerBiases)
	local output = {}
	for i = 1, #layerOutput, 1 do
		-- print(matrix(layerOutput[i]))
		-- print("+")
		-- print(matrix(layerBiases))
		output[i] = matrix(layerOutput[i]) + matrix(layerBiases)
	end
	return matrix(output)
end

-- input layer -> hidden layer 1
local inputs1 = { { 1, 2, 3, 2.5 }, { 2, 5, -1, 2 }, { -1.5, 2.7, 3.3, -0.8 } }
local weights1 = { { 0.2, 0.8, -0.5, 1 }, { 0.5, -0.91, 0.26, -0.5 }, { -0.26, -0.27, 0.17, 0.87 } }
local biases1 = { 2, 3, 0.5 }

-- hidden layer 1 -> hidden layer 2
local weights2 = { { 0.1, -0.14, 0.5 }, { -0.5, 0.12, -0.33 }, { -0.44, 0.73, -0.13 } }
local biases2 = { -1, 2, -0.5 }


local scalar = 2
local v1 = { 1, 2, 3 }
local v11 = { 1, 2, 3 }

local v2 = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } }
local v22 = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } }


local arr1 = ({ { 4, 2 }, { 0, 3 } })
local arr2 = ({ { 4, 0 }, { 1, 4 } })
local arr5 = { { 2, 2 }, { 0, 3 }, { 0, 4 } }
local arr6 = { { 2, 1, 3 }, { 3, 2, 4 } }
local arr3 = ({ 1, 2, 3 })
local arr4 = ({ 2, 4, 6 })

local arr7 = { { -1, 0, 4 }, { 2, 0, 0 } }
local arr8 = { { -1, 1 }, { -1, 3 }, { 2, 4 } }

-- print(matrix.dot(arr3, arr4))
-- TODO: Fix both of these results
-- local res = matrix.dot(weights1, inputs1[1])
local res = matrix.dot(inputs1, matrix.transpose(weights1), biases1)
print("res")
if type(res) == "table" then
	for i = 1, #res, 1 do
		if type(res[1]) == "table" then
			for j = 1, #res[i], 1 do
				print(res[i][j])
			end
		else
			print(res[i])
		end
	end
else
	print(res)
end

-- TODO: Fix this
-- print("inputs . weights + biases1")
-- print(matrix(inputs1[1]))
-- print(matrix(weights1))
-- print((matrix.dot(inputs1[1], weights1)))
--
-- print("2d vector . 2d vector")
-- print(matrix.dot((addBiases(matrix.transpose(inputs1), biases1)), weights1))


-- local layer1Outputs = batchCalculateLayoutOutput(inputs1, weights1, biases1)
-- print(layer1Outputs)
--
-- local layer2Outputs = batchCalculateLayoutOutput(layer1Outputs, weights2, biases2)
-- print(layer2Outputs)
--
-- print(calculateLayoutOutput(inputs1[1], weights1, biases1))



-- calculateLayoutOutput takes 3 params:
--     layerInputs = the outputs from the nodes of the previous layer
--     layerWeights = a table of weights, each table corresponding to a node in the working layer and each value in that table corresponding to the weight associated with a node from the previous layer
--     layerBiases = the number to add to the dot of

