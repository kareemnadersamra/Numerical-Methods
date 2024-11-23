% Initialize parameters
a = 0;  % Lower bound
b = 0.8;  % Upper bound
N = 1000;  % Number of random samples

% Generate random values for x uniformly in [a, b]
x = a + (b - a) * rand(N, 1);  

% Calculate y using the polynomial function
y = 0.2 + 25 .* x - 200 .* (x).^2 + 675 .* (x).^3 - 900 .* (x).^4 + 400 .* (x).^5;

% Find the maximum value of y to determine the height of the bounding box
H = max(y);

% Initialize counters for blue and red dots
blue_dots = 0;
red_dots = 0;

% Monte Carlo integration: count points under the curve
for i = 1:N
    % Random y value between 0 and H
    y_random = H * rand;

    % Check if the random point (x(i), y_random) is below the curve
    if y_random <= y(i)
        blue_dots = blue_dots + 1;  % Point is below the curve
        plot(x(i), y_random, 'bo');  % Plot blue dot
    else
        red_dots = red_dots + 1;  % Point is above the curve
        plot(x(i), y_random, 'ro');  % Plot red dot
    end
    hold on;  % Keep the previous plots
end

% Plot the polynomial function
x_plot = linspace(a, b, 100);  % Generate x values for the function plot
y_plot = 0.2 + 25 .* x_plot - 200 .* (x_plot).^2 + 675 .* (x_plot).^3 - 900 .* (x_plot).^4 + 400 .* (x_plot).^5;
plot(x_plot, y_plot, 'k-', 'LineWidth', 2);  % Plot the polynomial function

% Calculate the estimated area under the curve
area_estimate = (b - a) * H * (blue_dots / N);

% Display the results
disp(['Blue dots (under the curve): ', num2str(blue_dots)]);
disp(['Red dots (above the curve): ', num2str(red_dots)]);
disp(['Estimated area under the curve: ', num2str(area_estimate)]);

% Configure plot
xlabel('x');
ylabel('y');
title('Monte Carlo Integration');
legend('Random Points (Under Curve)', 'Random Points (Above Curve)', 'Polynomial Function', 'Location', 'Best');
grid on;
axis([a b 0 H]);  % Set axis limits
hold off;  % Release the plot hold





