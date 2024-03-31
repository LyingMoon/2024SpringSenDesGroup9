import torch
from NNnetwork import PolicyNet  
import scipy.io
import numpy as np

# Initialize the Trained Network
n_states=30
n_hiddens=128
n_actions=1
action_bound=120
net = PolicyNet(n_states, n_hiddens, n_actions, action_bound)
net.load_state_dict(torch.load('NN1Shot1.pth'))

# Ensure the model is in evaluation mode
net.eval()

# The test input data for machine learning algorithm
# You may have to change the path if you use your own one
test_data_path = r'C:\\D\\Course\\2024spring\\Senior Design\\TrainingData\\TestData.mat'
test_data = scipy.io.loadmat(test_data_path)
test_input = test_data['TestSet']  # The variable name inside the .mat file
test_input_array = np.array(test_input)
test_input_tensor = torch.tensor([test_input_array], dtype=torch.float32)

# The desired output for validate the reliability of the machine learning model
# You may have to change the path if you use your own one
test_data_value_path = r'C:\\D\\Course\\2024spring\\Senior Design\\TrainingData\\TestDataValue.mat'
test_data_value = scipy.io.loadmat(test_data_value_path)
test_value_input = test_data_value['TestDataValue']  # The variable name inside the .mat file
test_value_input_array = np.array(test_value_input)
test_value_input_array = test_value_input_array[:, 0] # Make the N*1 matrix to an array

with torch.no_grad(): 
    output = net(test_input_tensor)

testResults = []
trueResults = []
compareResult = []

# Initialize the counter
p = 1
# Each value represent a unique set of movement (do nothing, passing, about to shot, shotting)
for num in output.squeeze(): 
    if num < 25:
        testResults.append('Nothing'+str(p))
    elif num < 60:
        testResults.append('Passing'+str(p))
    # You can comment the following two lines and count it as a shot
    elif num < 90:
        testResults.append('About to Shot/Or shotting'+str(p))
    else:
        testResults.append('Shotting'+str(p))
    p= p+1
    
# Initialize the counter 
p = 1
# Each value represent a unique set of movement (do nothing, passing, about to shot, shotting)
for num2 in test_value_input_array:
    if num2 < 25:
        trueResults.append('Nothing'+str(p))
    elif num2 < 60:
        trueResults.append('Passing'+str(p))
    # You can comment the following two lines and count it as a shot
    elif num < 90:
        trueResults.append('About to Shot/Or shotting'+str(p))
    else:
        trueResults.append('Shotting'+str(p))
    p= p+1
    
# Recorded the number of successful classification
numOfTrue=0
for i in range (0,p-1):
    if trueResults[i] == testResults[i]:
        compareResult.append('True '+trueResults[i])
        numOfTrue=numOfTrue+1
    else:
        compareResult.append('False')

# Calculate the accuracy
Rate=numOfTrue/(p-1)

print(' ')
print('The result: ')
print(compareResult)
print('The accuracy of the machine learning model = ' + str(Rate))
