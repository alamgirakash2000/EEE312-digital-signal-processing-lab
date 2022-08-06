clc; clear; close;
format compact;

% Variables
n = -40 : 40;
RectangularPulse = zeros(1, length(n));
RectangularPulse(abs(n) <= 20) = 1.1;

M = 101;
wg = [pi pi/10 pi/5 pi/2];
wNum = [1 10 5 2];
for j = 1 : 4
    w = linspace(-wg(j), wg(j), M);
    dw = w(2) - w(1);
    X = zeros(1,M);
    for j1 = 1 : M
        for j2 = 1 : length(RectangularPulse)
            X(j1) = X(j1) + RectangularPulse(j2) * exp(-1i * w(j1) * n(j2));
        end
    end
    nRecon = -40 : 40;
    xRecon = zeros(1,length(nRecon));
    for j1 = 1 : M
        for j2 = 1 : length(xRecon)
            xRecon(j2) = xRecon(j2) + 1 / (2 * pi) * X(j1) * exp(1i * w(j1) * nRecon(j2)) * dw;
        end
    end
    subplot(2, 2, j)
    stem(nRecon, xRecon, '.k')
    xlabel('n', 'fontsize', 14);
    if j == 1
        ylabel('x(n)', 'fontsize', 14);
        title('Recctangular Pulse', 'fontsize', 14);
    else
        ylabel('x_{reconstructed}', 'fontsize', 14);
      title("Reconstracted Signal")
    end
end