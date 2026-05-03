%% ===============================
% Extracción de datos desde Simulink
% ===============================
clc

theta_m = out.THETA_M.Data;
omega_m = out.OMEGA_M.Data;
i_q     = out.IQS.Data;

t = out.tout;
t1 = out.IQS.Time;

%% ===============================
% Parámetros (definirlos acá o cargarlos)
% ===============================

p        = 2;          % pares de polos (ajustar)
lambda_f = 0.1;        % flujo (ajustar)

%% ===============================
% Cálculo del torque electromagnético
% ===============================

T_m = (3/2)*p*lambda_f .* i_q;

%% ===============================
% Gráficos
% ===============================

figure

subplot(3,1,1)
plot(t, theta_m, 'LineWidth',1.5)
grid on
title('\theta_m(t) - Posición angular')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')

subplot(3,1,2)
plot(t, omega_m, 'LineWidth',1.5)
grid on
title('\omega_m(t) - Velocidad angular')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]')

subplot(3,1,3)
plot(t1, T_m, 'LineWidth',1.5)
grid on
title('T_m(t) - Torque electromagnético')
xlabel('Tiempo [s]')
ylabel('Torque [N·m]')