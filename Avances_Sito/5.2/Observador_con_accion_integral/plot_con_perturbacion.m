%% Gráficos de Consignas de Posición y Velocidad

% 1. Extraemos los tiempos y datos del objeto 'out'
% (Extraemos un vector de tiempo individual por si el paso fue variable)

% Figura 1: Perturbacion
t_pert = out.pert.Time;
pert = out.pert.Data;

% Figura 3: Consigna de velocidad del eje mecánico
t_omega_m = out.omega_m_Ref.Time;
omega_m_Ref = out.omega_m_Ref.Data;


% --- Figura 1: Perturbacion ---
figure(1);
plot(t_pert, pert, 'k', 'LineWidth', 1.5)
grid on
title('Perturbación')
xlabel('Tiempo [s]')
ylabel('Torque [N.m]')
xlim([0 max(t_pert)])


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
title('Consigna de posición vs posicion medida Zoom en t = 7 ')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
legend('\theta^*_m (Referencia)', '\theta_m (Medida)', 'Location', 'best')

% 3. --- Configuración específica del ZOOM ---

% Límites y pasos del eje X (Tiempo: de 5.998 a 6.014 con paso de 0.002)
xlim([6.998 7.018])
xticks(6.998:0.002:7.018)

% Límites y pasos del eje Y (Posición: de 753.95 a 754.04 con paso de 0.01)
ylim([-16e-4 4e-4])
yticks(-16e-4:2e-4:4e-4)

% 3. --- Configuración específica del ZOOM para parametros maximos ---

%=================================================================

% xlim([6.998 7.034])
% xticks(6.998:0.002:7.034)
% 
% ylim([-16e-4 4e-4])
% yticks(-16e-4:2e-4:4e-4)

%================================================================

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
title('Posición medida vs observada zoom t = 7')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
legend('\theta_m (Medida)', '\theta_{obs} (Observada)', 'Location', 'best')

% 3. --- Configuración específica del ZOOM para parametros minimos ---

% Límites y pasos del eje X (Tiempo: de 5.999 a 6.009 con paso de 0.001)
xlim([6.998 7.016])
xticks(6.998:0.002:7.016)

% Límites y pasos del eje Y (Posición: de 753.94 a 754.06 con paso de 0.1)
ylim([-16e-4 2e-4])
yticks(-16e-4:2e-4:2e-4)
%=================================================================

% 3. --- Configuración específica del ZOOM para parametros maximos ---

%=================================================================

% xlim([6.998 7.045])
% xticks(6.998:0.01:7.045)
% 
% ylim([-16e-4 4e-4])
% yticks(-16e-4:2e-4:4e-4)

%================================================================

%% Figura 13: Error de estimación en la posicion

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

