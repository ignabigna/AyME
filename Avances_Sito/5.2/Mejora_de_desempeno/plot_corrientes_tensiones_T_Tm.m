%% Gráfico de Posición del eje mecánico (Consigna vs Real)

% 1. Extraemos el tiempo y los datos de las variables desde Simulink
t_theta = out.theta_m.Time;
theta_m = out.theta_m.Data;

t_theta_cons = out.theta_m_cons_pos.Time;
theta_m_cons_pos = out.theta_m_cons_pos.Data;

% 2. Creamos la figura
figure;

% Ploteamos la consigna (línea negra punteada) y la posición real (línea azul)
plot(t_theta_cons, theta_m_cons_pos, 'k', 'LineWidth', 1.5)
hold on
plot(t_theta, theta_m, 'b', 'LineWidth', 1.5)
grid on
hold off

% 3. Títulos, etiquetas y leyenda
title('\theta_m(t) - Posición del eje mecánico')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
legend('\theta_m medida (Obtenida con \theta_m^* trapezoidal)', '\theta_m medida (Obtenida con \omega_m^* trapezoidal)', 'Location', 'best')

% 4. --- Configuración de los ejes (Sin zoom) ---
% Ajustamos el eje X para que muestre toda la simulación basándonos en el tiempo máximo
xlim([0 max(t_theta)])

% --- Figura 2: Zoom en t = 6 ---
figure(2);

% Ploteamos nuevamente la consigna y la posición real
plot(t_theta_cons, theta_m_cons_pos, 'k', 'LineWidth', 1.5)
hold on
plot(t_theta, theta_m, 'b', 'LineWidth', 1.5)
grid on
hold off

% Títulos, etiquetas y leyenda
title('Zoom en t = 6')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
legend('\theta_m medida (Obtenida con \theta_m^* trapezoidal)', '\theta_m medida (Obtenida con \omega_m^* trapezoidal)', 'Location', 'best')
% --- Configuración de los ejes (Zoom aplicado) ---
% Eje X (Tiempo): de 5.5 a 6.4 con paso de 0.1
xlim([5.5 6.4])
xticks(5.5:0.1:6.4)

% Eje Y (Posición): de 700 a 760 con paso de 5
ylim([700 760])
yticks(700:5:760)

%% Plot ia, ib, ic
t = out.i_a.Time;
i_a = out.i_a.Data;
i_b = out.i_b.Data;
i_c = out.i_c.Data;

figure; 

subplot(3,1,1)
plot(t, i_a, 'LineWidth',1.5)
grid on
title('i_{a}(t) - Correinte de fase a')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:1:max(t))

subplot(3,1,2)
plot(t, i_b, 'LineWidth',1.5)
grid on
title('i_{b}(t) - Correinte de fase b')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:1:max(t))

subplot(3,1,3)
plot(t, i_c, 'LineWidth',1.5)
grid on
title('i_{c}(t) - Correinte de fase c')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:1:max(t))

%% Plot va, vb, vc
v_a = out.v_a.Data;
v_b = out.v_b.Data;
v_c = out.v_c.Data;

figure; 

subplot(3,1,1)
plot(t, v_a, 'LineWidth',1.5)
grid on
title('V_{a}(t) - Tensión de fase a')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
xticks(0:1:max(t))

subplot(3,1,2)
plot(t, v_b, 'LineWidth',1.5)
grid on
title('V_{b}(t) - Tensión de fase b')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
xticks(0:1:max(t))

subplot(3,1,3)
plot(t, v_c, 'LineWidth',1.5)
grid on
title('v_{c}(t) - Tensión de fase c')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
xticks(0:1:max(t))

%% Figura 17: Torque Electromagnético

% 1. Extraemos el tiempo y los datos del torque desde el objeto 'out'
t_T_m = out.T_m.Time;
T_m = out.T_m.Data;

% 2. Creamos la figura
figure;

% Ploteamos el torque (usaremos color rojo y línea continua)
plot(t_T_m, T_m, 'r', 'LineWidth', 1.5)
grid on

% 3. Títulos y etiquetas
title('T_m(t) - Torque Electromagnético')
xlabel('Tiempo [s]')
ylabel('Torque [N·m]')

% Ajustamos los límites del eje X al tiempo máximo de la simulación
xlim([0 max(t_T_m)])
xticks(0:1:max(t))
%% Plot temeratura del estator
T_s = out.T_s.Data;

figure;

plot(t, T_s, 'LineWidth',1.5)
grid on
title('T_s(t) - Temperratura del bobinado del estator')
xlabel('Tiempo [s]')
ylabel('Temperatura [°C]')
xticks(0:1:max(t))