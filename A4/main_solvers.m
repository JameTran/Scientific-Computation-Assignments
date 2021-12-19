function main_solvers()
    syms f(x) g(x);
    mu = 0.012277471;
    muhat = 1 - mu;
    eq1 = f + 2*diff(g) - muhat*((f + mu)/((f+mu)^2 + g^2)^(3/2)) - mu*((f - muhat)/((f - muhat).^2 + g.^2).^(3/2)) == diff(f,2);
    eq2 = g - 2*diff(f) - muhat*(g/(((f + mu).^2 + g.^2).^(3/2))) - mu*(g/(((f - muhat).^2 + g.^2).^(3/2))) == diff(g, 2);
    f0 = 0.994;
    fdiff0 = 0;
    g0 = 0;
    gdiff0 = -2.001585106379082522420537862224;
    yinitial = [f0, fdiff0, g0, gdiff0];
    [teq1, teq2] = odeToVectorField([eq1, eq2])
    func = matlabFunction(teq1, 'vars', {'t', 'Y'})
    bounds = [0 1000];
    temp = odeset('RelTol',1e-10, 'AbsTol',1e-10);

    tic;
    [t23, y23, stats23] = ode23(func, bounds, yinitial, temp);
    CPU(1) = toc;
    steps(1) = stats23(1);
    failed_steps(1) = stats23(2);
    function_evaluation(1) = stats23(3);

    tic;
    [t45, y45, stats45] = ode45(func, bounds, yinitial, temp);
    CPU(2) = toc;
    steps(2) = stats45(1);
    failed_steps(2) = stats45(2);
    function_evaluation(2) = stats45(3);

    tic;
    [t78, y78, stats78] = ode78(func, bounds, yinitial, temp);
    CPU(3) = toc;
    steps(3) = stats78(1);
    failed_steps(3) = stats78(2);
    function_evaluation(3) = stats78(3);

    tic;
    [t89, y89, stats89] = ode89(func, bounds, yinitial, temp);
    CPU(4) = toc;
    steps(4) = stats89(1);
    failed_steps(4) = stats89(2);
    function_evaluation(4) = stats89(3);

    tic;
    [t113, y113, stats113] = ode113(func, bounds, yinitial, temp);
    CPU(5) = toc;
    steps(5) = stats113(1);
    failed_steps(5) = stats113(2);
    function_evaluation(5) = stats113(3);
    solver = ["ode23", "ode45", "ode78", "ode89", "ode113"]';
    CPU = CPU';
    steps = steps';
    failed_steps = failed_steps';
    function_evaluation = function_evaluation';
    ayo = table(solver, CPU, steps, failed_steps, function_evaluation)




end