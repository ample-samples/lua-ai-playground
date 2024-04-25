local matrix = require "utils/matrix"

local myMatrix = matrix { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } }
local myMatrix2 = matrix { { 3, 2, 1 }, { 4, 5, 6 }, { 7, 8, 9 } }

local inputs = { 1, 2, 3, 2.5 }

local weights1 = { 0.2, 0.8, -0.5, 1 }
local weights2 = { 0.5, -0.91, 0.26, -0.5 }
local weights3 = { -0.26, -0.27, 0.17, 0.87 }

local weights = matrix { weights1, weights2, weights3 }

local bias1 = 2
local bias2 = 3
local bias3 = 0.5

local biases = { bias1, bias2, bias3 }

-- calculateLayoutOutput takes 3 params:
--     layerInputs = the outputs from the nodes of the previous layer
--     layerWeights = a table of weights, each table corresponding to a node in the working layer and each value in that table corresponding to the weight associated with a node from the previous layer
--     layerBiases = the number to add to the dot of 
local function calculateLayoutOutput(layerInputs, layerWeights, layerBiases)
	local layerOutput = {};
	for i = 1, #layerBiases do

		-- basically the dot product of layerWeights and layerInputs
		local nodeSumWeightXInput = 0
		for j = 1, #layerInputs, 1 do
			nodeSumWeightXInput = nodeSumWeightXInput + layerWeights[i][j] * layerInputs[j]
		end
		nodeSumWeightXInput = matrix.dot(layerWeights, layerInputs)
		layerOutput[i] = layerBiases[i] + nodeSumWeightXInput
	end

	return matrix(layerOutput)
end

print(calculateLayoutOutput(inputs, weights, biases))




