%% Gráfico de variables desde un Mux triple (Posición)

% 1. Extraemos el tiempo y la matriz de datos
% Asumimos que el bloque to workspace se llama 'posicion'
t_mux = out.posicion.Time;
matriz_datos = out.posicion.Data;

% 2. Separamos las variables (según el orden de conexión al Mux)
theta_m_Referencia = matriz_datos(:, 1); % 1ra entrada: Referencia
theta_m = matriz_datos(:, 2);            % 2da entrada: Real/Medida
theta_obs = matriz_datos(:, 3);          % 3ra entrada: Observada

% --- FIGURA 1: Posición (Vista Completa) ---
figure(1);

% Referencia: Roja continua
plot(t_mux, theta_m_Referencia, 'r', 'LineWidth', 1.5)
hold on
% Real: Verde oscuro a trazos (usamos código RGB [0 0.5 0])
plot(t_mux, theta_m, '--', 'Color', [0 0.5 0], 'LineWidth', 1.5)
% Observada: Violeta punteada
plot(t_mux, theta_obs, ':', 'Color', [0.5 0 0.8], 'LineWidth', 2)
grid on
hold off

% Títulos y etiquetas
title('\theta_m(t) - Posición (Datos desde Mux)')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
legend('\theta_m^* (Referencia)', '\theta_m (Medida)', '\theta_{obs} (Observada)', 'Location', 'best')

% --- FIGURA 2: Posición (Zoom) ---
figure(2);

% Volvemos a plotear las mismas señales
plot(t_mux, theta_m_Referencia, 'r', 'LineWidth', 1.5)
hold on
plot(t_mux, theta_m, '--', 'Color', [0 0.5 0], 'LineWidth', 1.5)
plot(t_mux, theta_obs, ':', 'Color', [0.5 0 0.8], 'LineWidth', 2)
grid on
hold off

% Títulos y etiquetas
title('\theta_m(t) - Zoom de Posición')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
legend('\theta_m^* (Referencia)', '\theta_m (Medida)', '\theta_{obs} (Observada)', 'Location', 'best')

% Configuración del Zoom X e Y
xlim([12.99 13.08])
xticks(12.99:0.01:13.08) % Ajustado a paso 0.01 por la escala

ylim([-4e-4 14e-4])
yticks(-4e-4:2e-4:14e-4) % Ajustado a paso 2e-14 por la escala

%% Gráfico de las Corrientes del Estator (a, b, c) desde un Mux triple

% 1. Extraemos el tiempo y la matriz de datos de corriente
% Asumimos que el bloque to workspace se llama 'corrientes'
t_corr = out.corrientes.Time;
matriz_corrientes = out.corrientes.Data;

% 2. Separamos las variables (según el orden de conexión al Mux: a, b, c)
i_a = matriz_corrientes(:, 1); % 1ra entrada: Corriente fase a
i_b = matriz_corrientes(:, 2); % 2da entrada: Corriente fase b
i_c = matriz_corrientes(:, 3); % 3ra entrada: Corriente fase c

% --- FIGURA 3: Corrientes (Vista Completa) ---
figure(3);

% Corrientes a, b y c
plot(t_corr, i_a, 'r', 'LineWidth', 1.5)
hold on
plot(t_corr, i_b, 'b', 'LineWidth', 1.5)
plot(t_corr, i_c, 'k', 'LineWidth', 1.5)
grid on
hold off

% Títulos y etiquetas
title('Corrientes del Estator: i_a(t), i_b(t), i_c(t)')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
legend('i_a', 'i_b', 'i_c', 'Location', 'best')
xlim([0 max(t_corr)])

% --- FIGURA 4: Corrientes (Zoom) ---
figure(4);

% Volvemos a plotear las mismas señales
plot(t_corr, i_a, 'r', 'LineWidth', 1.5)
hold on
plot(t_corr, i_b, 'b', 'LineWidth', 1.5)
plot(t_corr, i_c, 'k', 'LineWidth', 1.5)
grid on
hold off

% Títulos y etiquetas
title('Corrientes del Estator (Zoom)')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
legend('i_a', 'i_b', 'i_c', 'Location', 'best')

% Configuración del Zoom X e Y
xlim([0.98 1.18])
xticks(0.98:0.02:1.18)

ylim([-0.8 1.2])
yticks(-0.8:0.2:1.2)


%% Gráfico de Temperatura del Estator (T_s)

% 1. Extraemos el tiempo y los datos de temperatura desde Simulink
t_temp = out.T_s.Time;
T_s_data = out.T_s.Data;

% 2. Creamos una nueva figura
figure;

% Ploteamos la temperatura (usamos color rojo)
plot(t_temp, T_s_data, 'r', 'LineWidth', 1.5)
grid on

% 3. Títulos y etiquetas
title('T_s(t) - Temperatura del bobinado del estator')
xlabel('Tiempo [s]')
ylabel('Temperatura [°C]')

% 4. Configuración del eje X (ZOOM aplicado)
% Límite y pasos del eje X (Tiempo: de 1 a 1.026 con paso de 0.002)

