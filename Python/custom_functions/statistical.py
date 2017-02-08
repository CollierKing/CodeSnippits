

##Residual Sum of Squares

def get_residual_sum_of_squares(model, data, outcome):
    # First get the predictions
    predictions = model.predict(data)
    # Then compute the residuals/errors
    residuals = outcome - predictions
    # Then square and add them up
    RSS = (residuals * residuals).sum()
    return(RSS)
	
rss_example_train = get_residual_sum_of_squares(example_model, test_data, test_data['price'])

##Gradient Descent

from math import sqrt

def regression_gradient_descent(feature_matrix, output, initial_weights, step_size, tolerance):
    converged = False 
    weights = np.array(initial_weights) # make sure it's a numpy array
    while not converged:
        # compute the predictions based on feature_matrix and weights using your predict_output() function
        predictions = predict_output(feature_matrix, weights)
        # compute the errors as predictions - output
        errors = predictions - output
        gradient_sum_squares = 0 # initialize the gradient sum of squares
        # while we haven't reached the tolerance yet, update each feature's weight
        for i in range(len(weights)): # loop over each weight
            # Recall that feature_matrix[:, i] is the feature column associated with weights[i]
            # compute the derivative for weight[i]:
            derivative = feature_derivative(errors, feature_matrix[:, i])
            # add the squared value of the derivative to the gradient sum of squares (for assessing convergence)
            gradient_sum_squares += (derivative**2)
            # subtract the step size times the derivative from the current weight
            weights[i] -= (step_size * derivative)
        # compute the square-root of the gradient sum of squares to get the gradient magnitude:
        gradient_magnitude = sqrt(gradient_sum_squares)
        if gradient_magnitude < tolerance:
            converged = True
    return(weights)
	
# let's test out the gradient descent
simple_features = ['sqft_living']
my_output = 'price'
(simple_feature_matrix, output) = get_numpy_data(train_data, simple_features, my_output)
initial_weights = np.array([-47000., 1.])
step_size = 7e-12
tolerance = 2.5e7

test = regression_gradient_descent(simple_feature_matrix,output,initial_weights,step_size,tolerance)
print test

(test_simple_feature_matrix, test_output) = get_numpy_data(test_data, simple_features, my_output)

test_predictions = predict_output(test_simple_feature_matrix, test)
print test_predictions

test_residuals = test_output - test_predictions
test_RSS = (test_residuals * test_residuals).sum()
print test_RSS