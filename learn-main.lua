require("learn/learn")
local utils = require "utils/utils"

print()

-- XOR training data
local train_features = {{0, 0}, {0, 1}, {1, 0}, {1, 1}}
local train_labels = {{0}, {1}, {1}, {0}}
local n_input = #train_features[1]
local n_output = #train_labels[1]

local model = learn.model.nnet({modules = {
  learn.layer.linear({n_input = n_input, n_output = n_input * 3}),
  learn.transfer.sigmoid({}),
  learn.layer.linear({n_input = n_input * 3, n_output = n_output}),
  learn.transfer.sigmoid({}),
}})
local epochs = 1
local error = model.fit(train_features, train_labels, epochs)
