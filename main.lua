local matrix = require "utils/matrix"
-- local STP = require "StackTracePlus"
-- debug.traceback = STP.stracktrace

-- input layer -> hidden layer 1
local inputs1 = matrix { { 1, 2, 3, 2.5 }, { 2, 5, -1, 2 }, { -1.5, 2.7, 3.3, -0.8 } }
local weights1 = matrix { { 0.2, 0.8, -0.5, 1 }, { 0.5, -0.91, 0.26, -0.5 }, { -0.26, -0.27, 0.17, 0.87 } }
local biases1 = { 2, 3, 0.5 }

-- hidden layer 1 -> hidden layer 2
local weights2 = matrix { { 0.1, -0.14, 0.5 }, { -0.5, 0.12, -0.33 }, { -0.44, 0.73, -0.13 } }
local biases2 = { -1, 2, -0.5 }


-- calculateLayoutOutput takes 3 params:
--     layerInputs = the outputs from the nodes of the previous layer
--     layerWeights = a table of weights, each table corresponding to a node in the working layer and each value in that table corresponding to the weight associated with a node from the previous layer
--     layerBiases = the number to add to the dot of
local function calculateLayoutOutput(layerInputs, layerWeights, layerBiases)
	local layerOutput = {};
	for i = 1, #layerBiases do
		nodeSumWeightXInput = 0
			print(matrix(layerInputs))

		for j = 1, #layerInputs, 1 do
			nodeSumWeightXInput = nodeSumWeightXInput + layerWeights[i][j] * layerInputs[j]
		end
		layerOutput[i] = layerBiases[i] + nodeSumWeightXInput
	end

	return matrix(layerOutput)
end

for i = 1, #matrix.column(inputs1, 3), 1 do
	print("col" .. i)
	print(matrix.column(inputs1, 3)[i])
end

local function batchCalculateLayoutOutput(batchInputs, layerWeights, layerBiases)
	local batchOutput = {}

	for i = 1, #batchInputs, 1 do
		batchOutput[i] = calculateLayoutOutput(batchInputs[i], layerWeights, layerBiases)
	end

	return matrix(batchOutput)
end

local layer1Outputs = batchCalculateLayoutOutput(inputs1, weights1, biases1)
print(layer1Outputs)

local layer2Outputs = batchCalculateLayoutOutput(layer1Outputs, weights2, biases2)
print(layer2Outputs)

print(calculateLayoutOutput(inputs1[1], weights1, biases1))
