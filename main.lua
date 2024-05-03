local matrix = require "utils/matrix"
-- local STP = require "StackTracePlus"
-- debug.traceback = STP.stracktrace

-- input layer -> hidden layer 1
local inputs1 = matrix { { 1, 2, 3, 2.5 }, { 2, 5, -1, 2 }, { -1.5, 2.7, 3.3, -0.8 } }
local weights1 = matrix({ { 0.2, 0.8, -0.5, 1 }, { 0.5, -0.91, 0.26, -0.5 }, { -0.26, -0.27, 0.17, 0.87 } })
local biases1 = { 2, 3, 0.5 }

-- hidden layer 1 -> hidden layer 2
local weights2 = matrix { { 0.1, -0.14, 0.5 }, { -0.5, 0.12, -0.33 }, { -0.44, 0.73, -0.13 } }
local biases2 = { -1, 2, -0.5 }


-- calculateLayoutOutput takes 3 params:
--     layerInputs = the outputs from the nodes of the previous layer
--     layerWeights = a table of weights, each table corresponding to a node in the working layer and each value in that table corresponding to the weight associated with a node from the previous layer
--     layerBiases = the number to add to the dot of
local function calculateLayerOutput(layerInputs, layerWeights, layerBiases)
	local layerOutput = {};
	for i = 1, #layerBiases do
		local nodeSumWeightXInput = 0
			print(matrix(layerInputs))

		for j = 1, #layerInputs, 1 do
			nodeSumWeightXInput = nodeSumWeightXInput + layerWeights[i][j] * layerInputs[j]
		end
		layerOutput[i] = layerBiases[i] + nodeSumWeightXInput
	end

	return matrix(layerOutput)
end

for i = 1, #matrix.column(inputs1, 3), 1 do
	-- print("col" .. i)
	-- print(matrix.column(inputs1, 3)[i])
end

local function batchCalculateLayerOutput(batchInputs, layerWeights, layerBiases)
	local batchOutput = {}

	for i = 1, #batchInputs, 1 do
		batchOutput[i] = calculateLayerOutput(batchInputs[i], layerWeights, layerBiases)
	end

	return matrix(batchOutput)
end

-- tests

local scalar = 2
local v1 = { 1, 2, 3 }
local v11 = { 1, 2, 3 }

local v2 = {{ 1, 2, 3 }, { 4, 5, 6 },{ 7, 8, 9 }}
local v22 = {{ 1, 2, 3 }, { 4, 5, 6 },{ 7, 8, 9 }}

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

local function addBiases(layerOutput, layerBiases)
    local output = {}
		for i = 1, #layerOutput, 1 do
		print(matrix(layerOutput[i]))
		print("+")
		print(matrix(layerBiases))
		    output[i] = matrix(layerOutput[i]) + matrix(layerBiases)
		end
	return matrix(output)
end

-- TODO: Fix this
print("inputs . weights + biases1")
print((matrix.dot(inputs1[1], weights1)))
print(addBiases(matrix.dot((inputs1[1]), weights1), biases1))

print("2d vector . 2d vector")
print(matrix.dot(inputs1, weights1))


-- local layer1Outputs = batchCalculateLayoutOutput(inputs1, weights1, biases1)
-- print(layer1Outputs)
--
-- local layer2Outputs = batchCalculateLayoutOutput(layer1Outputs, weights2, biases2)
-- print(layer2Outputs)
--
-- print(calculateLayoutOutput(inputs1[1], weights1, biases1))
