function main_orbit()

format long
planet_data = table2array(readtable("nbody.dat"));
data_size = size(planet_data, 1);


jupiter_x = planet_data(:, 2);
jupiter_y = planet_data(:, 3);

saturn_x = planet_data(:, 5);
saturn_y = planet_data(:, 6);

uranus_x = planet_data(:, 8);
uranus_y = planet_data(:, 9);

neptune_x = planet_data(:, 11);
neptune_y = planet_data(:, 12);

pluto_x = planet_data(:, 14);
pluto_y = planet_data(:, 15);

temp = ones(1, data_size)';

jupiter_a = horzcat(jupiter_y.^2, jupiter_x.*jupiter_y, jupiter_x, jupiter_y ...
    ,temp);

jupiter_coeffs = jupiter_a\jupiter_x.^2;

saturn_a = horzcat(saturn_y.^2, saturn_x.*saturn_y, saturn_x, saturn_y ...
    ,temp);
saturn_coeffs = saturn_a\saturn_x.^2;

uranus_a = horzcat(uranus_y.^2, uranus_x.*uranus_y, uranus_x, uranus_y ...
    ,temp);
uranus_coeffs = uranus_a\uranus_x.^2;

neptune_a = horzcat(neptune_y.^2, neptune_x.*neptune_y, neptune_x, neptune_y ...
    ,temp);
neptune_coeffs = neptune_a\neptune_x.^2;

pluto_a = horzcat(pluto_y.^2, pluto_x.*pluto_y, pluto_x, pluto_y ...
    ,temp);
pluto_coeffs = pluto_a\pluto_x.^2;   

planets = ["Jupiter", "Saturn", "Uranus", "Neptune", "Pluto"]';
a = [jupiter_coeffs(1), saturn_coeffs(1), uranus_coeffs(1), ... 
    neptune_coeffs(1), pluto_coeffs(1)]';

b = [jupiter_coeffs(2), saturn_coeffs(2), uranus_coeffs(2), ...
    neptune_coeffs(2), pluto_coeffs(2)]';

c = [jupiter_coeffs(3), saturn_coeffs(3), uranus_coeffs(3), ...
    neptune_coeffs(3), pluto_coeffs(3)]';

d = [jupiter_coeffs(4), saturn_coeffs(4), uranus_coeffs(4), ...
    neptune_coeffs(4), pluto_coeffs(4)]';

e = [jupiter_coeffs(5), saturn_coeffs(5), uranus_coeffs(5), ...
    neptune_coeffs(5), pluto_coeffs(5)]';

fun = table(planets, a, b, c, d, e)


% x = jupiter_x;
% y = jupiter_y;
% 
% a = jupiter_coeffs(1);
% b = jupiter_coeffs(2);
% c = jupiter_coeffs(3);
% d = jupiter_coeffs(4);
% e = jupiter_coeffs(5);
% 
% plot(x,y);
% hold on;
% [xs, ys] = meshgrid(min(x)-1:0.1:max(x)+1, min(y)-1:0.1:max(y)+1);
% contour(xs, ys, a*ys.^2+b*xs.*ys+c*xs+d*ys+e-xs.^2, [0, 0], 'k--', 'LineWidth', 1);


end

