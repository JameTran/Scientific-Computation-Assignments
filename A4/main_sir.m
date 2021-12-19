function main_sir()
    n = 1000;
    I0 = 1;
    S0 = n - I0;
    R0 = 0;

    [t, x] = ode45(@ode0point9, [0 200], [S0; I0; R0])

    figure
    plot(t, x(:, 1));
    hold on
    plot(t, x(:, 2));
    plot(t, x(:, 3));
    hold off

    [t, x1] = ode45(@ode1, [0 200], [S0; I0; R0])
    figure
    plot(t, x1(:, 1));
    hold on
    plot(t, x1(:, 2));
    plot(t, x1(:, 3));
    hold off

    [t, x2] = ode45(@ode3, [0 200], [S0; I0; R0])
    figure
    plot(t, x2(:, 1));
    hold on
    plot(t, x2(:, 2));
    plot(t, x2(:, 3));
    hold off

    [t, x3] = ode45(@ode5, [0 200], [S0; I0; R0])
    figure
    plot(t, x3(:, 1));
    hold on
    plot(t, x3(:, 2));
    plot(t, x3(:, 3));
    hold off

end

function res = ode0point9(t, x)
  n = 1000;
  I0 = 1;
  S0 = n - I0;
  R0 = 0;
  gamma = 1/14;
  S0R0 = 0.9;
  beta = S0R0*gamma/S0;
  res = [-beta*x(1)*x(2); beta*x(1)*x(2)-gamma*x(2); gamma*x(2)];
end

function res = ode1(t, x)
  n = 1000;
  I0 = 1;
  S0 = n - I0;
  R0 = 0;
  gamma = 1/14;
  S0R0 = 1;
  beta = S0R0*gamma/S0;
  res = [-beta*x(1)*x(2); beta*x(1)*x(2)-gamma*x(2); gamma*x(2)];
end

function res = ode3(t, x)
  n = 1000;
  I0 = 1;
  S0 = n - I0;
  R0 = 0;
  gamma = 1/14;
  S0R0 = 3;
  beta = S0R0*gamma/S0;
  res = [-beta*x(1)*x(2); beta*x(1)*x(2)-gamma*x(2); gamma*x(2)];
end

function res = ode5(t, x)
  n = 1000;
  I0 = 1;
  S0 = n - I0;
  R0 = 0;
  gamma = 1/14;
  S0R0 = 5;
  beta = S0R0*gamma/S0;
  res = [-beta*x(1)*x(2); beta*x(1)*x(2)-gamma*x(2); gamma*x(2)];
end