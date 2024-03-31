import scipy.io

# Specify the full path to your .mat file
input_path = r'c:\D\Course\2024spring\Senior Design\TrainingData\Input.mat'

# Load the .mat file
data = scipy.io.loadmat(input_path)

# Print all keys (variable names) in the .mat file
print(data.keys())