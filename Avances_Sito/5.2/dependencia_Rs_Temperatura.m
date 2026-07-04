%% Plot de torque y velocidad - reforzamiento y debilitamiento de campo


%% Plot de torque y velocidad - Rs Constante vs Rs Variable

% 1. Extraemos los tiempos individuales de cada simulación para evitar errores de dimensión
t_cte = out.omega_Rs_cte.Time;
t_var = out.omega_Rs_variable.Time;

% 2. Extraemos los datos
omega_Rs_cte = out.omega_Rs_cte.Data;
omega_Rs_variable = out.omega_Rs_variable.Data;

T_m_Rs_cte = out.T_m_Rs_cte.Data;
T_m_Rs_variable = out.T_m_Rs_variable.Data;

figure;

% --- Subplot 1: Velocidad ---
subplot(2,1,1)
% Ploteamos cada variable con su propio vector de tiempo
plot(t_cte, omega_Rs_cte, 'k', 'LineWidth', 1.5)
hold on
plot(t_var, omega_Rs_variable, 'r', 'LineWidth', 1.5)
grid on
hold off % Es buena práctica "soltar" el gráfico al terminar

% Títulos, etiquetas y leyenda corregida
title('\omega(t) - Velocidad del Motor')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]') 
legend('R_s Constante', 'R_s Variable', 'Location', 'best') % Solo 2 etiquetas ahora
xlim([0 max(t_cte)]) % Usamos el tiempo máximo para ajustar la grilla

% --- Subplot 2: Torque ---
subplot(2,1,2)
% Ploteamos cada variable con su propio vector de tiempo
plot(t_cte, T_m_Rs_cte, 'k', 'LineWidth', 1.5)
hold on
plot(t_var, T_m_Rs_variable, 'r', 'LineWidth', 1.5)
grid on
hold off

% Títulos, etiquetas y leyenda corregida
title('T_m(t) - Torque Electromagnético')
xlabel('Tiempo [s]')
ylabel('Torque [N·m]')
legend('R_s Constante', 'R_s Variable', 'Location', 'best') % Solo 2 etiquetas ahora
xlim([0 max(t_cte)])