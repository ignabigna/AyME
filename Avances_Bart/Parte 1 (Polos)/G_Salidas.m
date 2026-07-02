%% ===============================
% Extracción de datos desde Simulink
% ===============================
clc

theta_m = out.THETA_M.Data;
omega_m = out.OMEGA_M.Data;
i_q     = out.IQS.Data;
T_s = out.T_S.Data;

t = out.tout;
t1 = out.IQS.Time;

%% ===============================

% ===============================

p        = 3;          % pares de polos 
lambda_f = 0.016;        % flujo 
%% ===============================
% Cálculo del torque electromagnético
% ===============================

T_m = (3/2)*p*lambda_f .* i_q;

%% ===============================
% Gráficos
% ===============================

figure(1)

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

figure(2)

plot(t, T_s, 'r', 'LineWidth', 1.5);
title('Torque de carga T_L');
xlabel('Tiempo [s]');
ylabel('Torque [Nm]');
grid on;

%----------GUARDADO DE VECTORES-----------
save('VECTOR_theta_LTI.mat', 'theta_m')
save('VECTOR_omega_LTI.mat', 'omega_m')
save('VECTOR_Torque_LTI.mat', 'T_m')
