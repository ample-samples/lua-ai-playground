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

local biases = matrix { bias1, bias2, bias3 }

local function calculateLayoutOutput(layerInputs, layerWeights, layerBiases)
	local layerOutput = {};
	for i = 1, #layerBiases do
		nodeSumWeightXInput = 0

		for j = 1, #layerInputs, 1 do
			nodeSumWeightXInput = nodeSumWeightXInput + layerWeights[i][j] * layerInputs[j]
		end
		layerOutput[i] = layerBiases[i][1] + nodeSumWeightXInput
	end

	return matrix(layerOutput)
end

print(calculateLayoutOutput(inputs, weights, biases))




local output = {
	inputs[1][1] * weights1[1] +
	inputs[1][2] * weights1[2] +
	inputs[1][3] * weights1[3] +
	inputs[1][4] * weights1[4] + bias1,
	inputs[1][1] * weights2[1] + inputs[1][2] * weights2[2] + inputs[1][3] * weights2[3] + inputs[1][4] * weights2[4] +
	bias2,
	inputs[1][1] * weights3[1] + inputs[1][2] * weights3[2] + inputs[1][3] * weights3[3] + inputs[1][4] * weights3[4] +
	bias3
}

for key, value in pairs(output) do
	print(key, value)
end
