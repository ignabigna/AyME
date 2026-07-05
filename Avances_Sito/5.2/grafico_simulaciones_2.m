%% Gráficos de Consignas de Posición y Velocidad

% 1. Extraemos los tiempos y datos del objeto 'out'
% (Extraemos un vector de tiempo individual por si el paso fue variable)

% Figura 1: Consigna de posición articular
t_q = out.q_Ref.Time;
q_Ref = out.q_Ref.Data;

% Figura 2: Consigna de posición del eje mecánico
t_theta_m = out.theta_m_Ref.Time;
theta_m_Ref = out.theta_m_Ref.Data;

% Figura 3: Consigna de velocidad del eje mecánico
t_omega_m = out.omega_m_Ref.Time;
omega_m_Ref = out.omega_m_Ref.Data;

% Figura 4: Consigna de velocidad articular
t_omega_l = out.omega_l_Ref.Time;
omega_l_Ref = out.omega_l_Ref.Data;


% --- Figura 1: Posición articular ---
figure(1);
plot(t_q, q_Ref, 'k', 'LineWidth', 1.5)
grid on
title('\theta^*_l(t) - Consigna de posición articular')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
xlim([0 max(t_q)])

% --- Figura 2: Posición del eje mecánico ---
figure(2);
plot(t_theta_m, theta_m_Ref, 'k', 'LineWidth', 1.5)
grid on
title('\theta^*_m(t) - Consigna de posición del eje mecánico')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
xlim([0 max(t_theta_m)])

% --- Figura 3: Velocidad del eje mecánico ---
figure(3);
plot(t_omega_m, omega_m_Ref, 'k', 'LineWidth', 1.5)
grid on
title('\omega^*_m(t) - Consigna de velocidad del eje mecánico')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]')
xlim([0 max(t_omega_m)])

% --- Figura 4: Velocidad articular ---
figure(4);
plot(t_omega_l, omega_l_Ref, 'k', 'LineWidth', 1.5)
grid on
title('\omega^*_l(t) - Consigna de velocidad articular')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]')
xlim([0 max(t_omega_l)])


%% Figura 5: Posición del eje mecánico (Referencia vs Real)

% 1. Extraemos los tiempos y datos de la posición real
% (Asumimos que la variable en el bloque To Workspace se llama theta_m)
t_theta_m_real = out.theta_m.Time;
theta_m = out.theta_m.Data;

% (Los datos de la referencia ya los habías extraído en el paso anterior, 
% pero los dejo acá por si corrés este bloque de forma independiente)
t_theta_m = out.theta_m_Ref.Time;
theta_m_Ref = out.theta_m_Ref.Data;

% 2. Creamos el gráfico comparativo
figure(5);

% Ploteamos la referencia (línea negra punteada)
plot(t_theta_m, theta_m_Ref, 'k', 'LineWidth', 1.5)
hold on
% Ploteamos la posición real (línea roja continua)
plot(t_theta_m_real, theta_m, 'r--', 'LineWidth', 1.5)
grid on
hold off % Soltamos el gráfico

% Títulos, etiquetas y leyenda
title('Consigna de posición vs posicion medida')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')

% Leyenda usando el intérprete TeX para los símbolos
legend('\theta^*_m (Referencia)', '\theta_m (Medida)', 'Location', 'best')

% Ajustamos los límites del eje X
xlim([0 max(t_theta_m_real)])

%% Figura 6: Zoom de la Posición del eje mecánico (Referencia vs Real)

% Asumimos que las variables t_theta_m, theta_m_Ref, t_theta_m_real 
% y theta_m ya están cargadas en el Workspace por el código de la Figura 5.

figure(6);

% 1. Ploteamos exactamente las mismas señales (Referencia y Real)
plot(t_theta_m, theta_m_Ref, 'k', 'LineWidth', 1.5)
hold on
plot(t_theta_m_real, theta_m, 'r--', 'LineWidth', 1.5)
grid on
hold off

% 2. Títulos, etiquetas y leyenda
title('Consigna de posición vs posicion medida Zoom en t = 6 ')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
legend('\theta^*_m (Referencia)', '\theta_m (Medida)', 'Location', 'best')

% 3. --- Configuración específica del ZOOM ---

% Límites y pasos del eje X (Tiempo: de 5.998 a 6.014 con paso de 0.002)
xlim([5.998 6.014])
xticks(5.998:0.002:6.014)

% Límites y pasos del eje Y (Posición: de 753.95 a 754.04 con paso de 0.01)
ylim([753.94 754.06])
yticks(753.94:0.01:754.06)

%% Figura 7: Error de Posición del eje mecánico

% 1. Extraemos el tiempo y los datos del error desde el objeto 'out'
t_e_theta = out.e_theta_m.Time;
e_theta_m = out.e_theta_m.Data;

% 2. Creamos la figura
figure(7);

% Ploteamos el error (usaremos color azul y línea continua)
plot(t_e_theta, e_theta_m, 'b', 'LineWidth', 1.5)
grid on

% 3. Títulos y etiquetas
title('e_{\theta}(t) - Error de seguimiento en la posición ')
xlabel('Tiempo [s]')
ylabel('Error [rad]')

% Ajustamos los límites del eje X al tiempo máximo de la simulación
xlim([0 max(t_e_theta)])

% Opcional: Si quieres forzar la grilla en X cada 1 segundo (o lo que necesites), 
% puedes descomentar la siguiente línea ajustando el paso (ej. 1s):
 xticks(0:1:max(t_e_theta))


%% Figura 8: Velocidad del eje mecánico (Referencia vs Real)

% 1. Extraemos los tiempos y datos de la velocidad de referencia y real
t_omega_m_ref = out.omega_m_Ref.Time;
omega_m_Ref = out.omega_m_Ref.Data;

t_omega_m_real = out.omega_m_real.Time;
omega_m_real = out.omega_m_real.Data;

% 2. Creamos la figura
figure(8);

% Ploteamos la referencia (línea negra punteada)
plot(t_omega_m_ref, omega_m_Ref, 'k', 'LineWidth', 1.5)
hold on
% Ploteamos la velocidad real (línea roja continua)
plot(t_omega_m_real, omega_m_real, 'r--', 'LineWidth', 1.5)
grid on
hold off

% 3. Títulos, etiquetas y leyenda
title('Consigna de velocidad vs velocidad medida')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]')
legend('\omega^*_m (Referencia)', '\omega_m (Medida)', 'Location', 'best')

% Ajustamos los límites del eje X
xlim([0 max(t_omega_m_real)])


%% Figura 9: Zoom de la Velocidad del eje mecánico (Referencia vs Real)

% Creamos la figura (usamos los mismos datos ya extraídos para la Figura 8)
figure(9);

% 1. Ploteamos exactamente las mismas señales
plot(t_omega_m_ref, omega_m_Ref, 'k', 'LineWidth', 1.5)
hold on
plot(t_omega_m_real, omega_m_real, 'r--', 'LineWidth', 1.5)
grid on
hold off

% 2. Títulos, etiquetas y leyenda
title('Consigna de velocidad vs velocidad medida Zoom en t = 6')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]')
legend('\omega^*_m (Referencia)', '\omega_m (Medida)', 'Location', 'best')

% 3. --- Configuración específica del ZOOM ---

% Límites y pasos del eje X (Tiempo: de 5.998 a 6.01 con paso de 0.002)
xlim([5.998 6.01])
xticks(5.998:0.002:6.01)

% Límites y pasos del eje Y (Velocidad: de -40 a 160 con paso de 20)
ylim([-80 160])
yticks(-80:20:160)

%% Figura 10: Error de seguimiento en la velocidad

% 1. Extraemos el tiempo y los datos del error de velocidad desde el objeto 'out'
t_e_omega = out.e_omega_m.Time;
e_omega_m = out.e_omega_m.Data;

% 2. Creamos la figura
figure(10);

% Ploteamos el error de velocidad (usaremos color azul y línea continua)
plot(t_e_omega, e_omega_m, 'b', 'LineWidth', 1.5)
grid on

% 3. Títulos y etiquetas
title('e_{\omega}(t) - Error de seguimiento en la velocidad')
xlabel('Tiempo [s]')
ylabel('Error de Velocidad [rad/s]')

% Ajustamos los límites del eje X al tiempo máximo de la simulación
xlim([0 max(t_e_omega)])
xticks(0:1:max(t_e_theta))

%% Figura 11: Posición del eje mecánico (Real vs Observada)

% 1. Extraemos tiempos y datos de las posiciones
% (Re-extraemos theta_m por si se ejecuta esta sección de manera independiente)
t_theta_m_real = out.theta_m.Time;
theta_m = out.theta_m.Data;

t_theta_obs = out.theta_obs.Time;
theta_obs = out.theta_obs.Data;

% 2. Creamos la figura
figure(11);

% Ploteamos la posición real (línea roja continua)
plot(t_theta_obs, theta_obs, 'b', 'LineWidth', 1.5)
hold on
plot(t_theta_m_real, theta_m, 'r--', 'LineWidth', 1.8)

% Ploteamos la posición observada (línea azul punteada)
%plot(t_theta_obs, theta_obs, 'b', 'LineWidth', 1.5)
grid on
hold off

% 3. Títulos, etiquetas y leyenda
title('Posición medida vs observada')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
legend('\theta_m (Medida)', '\theta_{obs} (Observada)', 'Location', 'best')

% Ajustamos los límites del eje X
xlim([0 max(t_theta_m_real)])


%% Figura 12: Zoom de Posición del eje mecánico (Real vs Observada)

% Creamos la figura
figure(12);

% 1. Ploteamos exactamente las mismas señales
plot(t_theta_m_real, theta_m, 'r--', 'LineWidth', 1.5)
hold on
plot(t_theta_obs, theta_obs, 'b', 'LineWidth', 1.5)
grid on
hold off

% 2. Títulos, etiquetas y leyenda
title('Posición medida vs observada zoom t = 6')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
legend('\theta_m (Medida)', '\theta_{obs} (Observada)', 'Location', 'best')

% 3. --- Configuración específica del ZOOM ---

% Límites y pasos del eje X (Tiempo: de 5.999 a 6.009 con paso de 0.001)
xlim([5.999 6.009])
xticks(5.999:0.001:6.009)

% Límites y pasos del eje Y (Posición: de 753.94 a 754.06 con paso de 0.1)
ylim([753.94 754.06])
yticks(753.94:0.01:754.06)

%% Figura 13: Error de estimación de la posición del eje mecánico

% 1. Extraemos el tiempo y los datos del error de estimación.
% Nota: Renombramos las variables de MATLAB (t_e_theta_est y e_theta_m_est) 
% para evitar pisarlas con el error de seguimiento de la Figura 7, aunque
% la variable en Simulink se llame igual ("e_theta_m").
t_e_theta_est = out.e_obs_theta.Time;
e_theta_m_est = out.e_obs_theta.Data;

% 2. Creamos la figura
figure(13);

% Ploteamos el error de estimación (color azul, línea continua)
plot(t_e_theta_est, e_theta_m_est, 'b', 'LineWidth', 1.5)
grid on

% 3. Títulos y etiquetas
title('Error de estimación de la posición')
xlabel('Tiempo [s]')
ylabel('Error de estimación [rad]')

% Ajustamos los límites del eje X
xlim([0 max(t_e_theta_est)])

%% Figura 14: Velocidad del eje mecánico (Real vs Observada)

% 1. Extraemos tiempos y datos de las velocidades
% (Re-extraemos omega_m_real por si se ejecuta esta sección de manera independiente)
t_omega_m_real = out.omega_m_real.Time;
omega_m_real = out.omega_m_real.Data;

t_omega_obs = out.omega_obs.Time;
omega_obs = out.omega_obs.Data;

% 2. Creamos la figura
figure(14);

% Ploteamos la velocidad real (línea roja continua)
plot(t_omega_m_real, omega_m_real, 'r', 'LineWidth', 1.5)
hold on
% Ploteamos la velocidad observada (línea azul punteada)
plot(t_omega_obs, omega_obs, 'b--', 'LineWidth', 1.8)
grid on
hold off

% 3. Títulos, etiquetas y leyenda
title('Velocidad medida vs observada')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]')
legend('\omega_m (Medida)', '\omega_{obs} (Observada)', 'Location', 'best')

% Ajustamos los límites del eje X
xlim([0 max(t_omega_m_real)])


%% Figura 15: Zoom de la Velocidad del eje mecánico (Real vs Observada)

% Creamos la figura
figure(15);

% 1. Ploteamos exactamente las mismas señales
plot(t_omega_m_real, omega_m_real, 'r--', 'LineWidth', 1.5)
hold on
plot(t_omega_obs, omega_obs, 'b', 'LineWidth', 1.5)
grid on
hold off

% 2. Títulos, etiquetas y leyenda
title('Velocidad medida vs observada zoom en t = 6')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]')
legend('\omega_m (Medida)', '\omega_{obs} (Observada)', 'Location', 'best')

% 3. --- Configuración específica del ZOOM ---

% Límites y pasos del eje X (Tiempo: de 5.998 a 6.01 con paso de 0.002)
xlim([5.998 6.01])
xticks(5.998:0.002:6.01)

% Límites y pasos del eje Y (Velocidad: de -80 a 160 con paso de 20)
ylim([-80 160])
yticks(-80:20:160)


%% Figura 16: Error de estimación de la velocidad del eje mecánico

% 1. Extraemos el tiempo y los datos del error de estimación de velocidad
t_e_obs_omega = out.e_obs_omega.Time;
e_obs_omega = out.e_obs_omega.Data;

% 2. Creamos la figura
figure(16);

% Ploteamos el error de estimación de velocidad (color azul, línea continua)
plot(t_e_obs_omega, e_obs_omega, 'b', 'LineWidth', 1.5)
grid on

% 3. Títulos y etiquetas
title('Error de estimación de la velocidad')
xlabel('Tiempo [s]')
ylabel('Error de estimación [rad/s]')

% Ajustamos los límites del eje X
xlim([0 max(t_e_obs_omega)])
xticks(0:1:max(t_e_obs_omega))
%% Plot iq, id, i0
i_qs = out.i_qs.Data;
i_ds = out.i_ds.Data;
i_0s = out.i_0s.Data;
t = out.i_qs.Time;
figure; 

subplot(3,1,1)
plot(t, i_qs, 'LineWidth',1.5)
grid on
title('i_{qs}(t) - Correinte eje q')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:1:max(t))

subplot(3,1,2)
plot(t, i_ds, 'LineWidth',1.5)
grid on
title('i_{ds}(t) - Correinte eje d')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:1:max(t))

subplot(3,1,3)
plot(t, i_0s, 'LineWidth',1.5)
grid on
title('i_{0s}(t) - Correinte eje 0')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:1:max(t))

%% Plot ia, ib, ic
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

%% Plot Vq, Vd, V0
v_qs = out.v_qs.Data;
v_ds = out.v_ds.Data;
v_0s = out.v_0s.Data;

figure; 

subplot(3,1,1)
plot(t, v_qs, 'LineWidth',1.5)
grid on
title('V_{qs}(t) - Tensión del eje q')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
xticks(0:1:max(t))

subplot(3,1,2)
plot(t, v_ds, 'LineWidth',1.5)
grid on
title('V_{ds}(t) - Tensión del eje d')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
xticks(0:1:max(t))

subplot(3,1,3)
plot(t, v_0s, 'LineWidth',1.5)
grid on
title('v_{0s}(t) - Tensión del eje 0')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
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