import torch
from torch import nn
from torch.nn import functional as F
import numpy as np

# A simple Neuron network that helps do classification
class PolicyNet(nn.Module):
    def __init__(self, n_states, n_hiddens, n_actions, action_bound):
        super(PolicyNet, self).__init__()
        # the maximum action
        self.action_bound = action_bound
        # only one hidden layer
        self.fc1 = nn.Linear(n_states, n_hiddens)
        
        self.fc2 = nn.Linear(n_hiddens, n_actions)
    # forward feedback
    def forward(self, x):
        x = self.fc1(x)  # [b,n_states]-->[b,n_hiddens]
        x = F.relu(x)
        x = self.fc2(x)  # [b,n_hiddens]-->[b,n_actions]
        x= torch.tanh(x)  # [-1,1]
        x = x * self.action_bound  #  [-action_bound, action_bound]
        return x
