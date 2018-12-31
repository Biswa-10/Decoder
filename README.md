# Decoder
Decode a secret message by applying Markov Chain and Monte Carlo simulations. 

The project assumes that the coded language is in English and has a one to one mapping from symbols in encoded message to the letters of English alphabet. From a random initial guaess we tend to converge to the decoded message by using the data obtained from the calculated first order transition matrix of english language.

For a comparison of how the language has evolved over time, the pictorial representation of the transition matrix for a few texts have been shown.

The intial assumption of a message coded in English has been discarded(Initially we had assumed that the encoded text had only 53 letters - space, A-Z, a-z). The removal of this assumtion leads to the addition of many new symbols so it becomes harder for the code to converge. And also lets to higher probability of the code jumping out of minima. Therefore we intend to try adding another order of transition.

*Update: instead of a fixed number of iterations, the termination condition has been updated for a more logical termination

