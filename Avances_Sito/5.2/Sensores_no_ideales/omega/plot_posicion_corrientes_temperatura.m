%% Gráfico de variables desde un Mux triple con Zoom

% 1. Extraemos el tiempo y la matriz de datos
% Asumimos que el bloque to workspace se llama 'posicion'
t_mux = out.posicion.Time;
matriz_datos = out.posicion.Data;

% 2. Separamos las variables (según el orden de conexión al Mux)
theta_m_Referencia = matriz_datos(:, 1);            % 1ra entrada: Real
theta_m = matriz_datos(:, 2); % 2da entrada: Referencia
theta_obs = matriz_datos(:, 3);          % 3ra entrada: Observada

% 3. Creamos la figura y ploteamos
figure;

% Referencia: Roja continua
plot(t_mux, theta_m_Referencia, 'r', 'LineWidth', 1.5)
hold on
% Real: Verde oscuro a trazos (usamos código RGB [0 0.5 0])
plot(t_mux, theta_m, '--', 'Color', [0 0.5 0], 'LineWidth', 1.5)
% Observada: Violeta punteada
plot(t_mux, theta_obs, ':', 'Color', [0.5 0 0.8], 'LineWidth', 2)
grid on
hold off

% 4. Títulos y etiquetas
title('\theta_m(t) - Posición (Datos desde Mux)')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')

% Usamos intérprete TeX para que las letras griegas se vean perfectas
legend('\theta_m^* (Referencia)', '\theta_m (Medida)', '\theta_{obs} (Observada)', 'Location', 'best')

% --- Configuración específica del ZOOM ---
% Límite y pasos del eje X (Tiempo: de 1 a 1.026 con paso de 0.002)
xlim([1 1.026])
xticks(1:0.002:1.026)

% Límite y pasos del eje Y (Posición: de -1 a 12 con paso de 2)
ylim([-1 12])
yticks(-1:2:12)

%% Gráfico de las Corrientes del Estator (a, b, c) desde un Mux triple

% 1. Extraemos el tiempo y la matriz de datos de corriente
% Asumimos que el bloque to workspace se llama 'corrientes'
t_corr = out.corrientes.Time;
matriz_corrientes = out.corrientes.Data;

% 2. Separamos las variables (según el orden de conexión al Mux: a, b, c)
i_a = matriz_corrientes(:, 1); % 1ra entrada: Corriente fase a
i_b = matriz_corrientes(:, 2); % 2da entrada: Corriente fase b
i_c = matriz_corrientes(:, 3); % 3ra entrada: Corriente fase c

% 3. Creamos la figura y ploteamos
figure;

% Corriente a: Roja
plot(t_corr, i_a, 'r', 'LineWidth', 1.5)
hold on
% Corriente b: Azul
plot(t_corr, i_b, 'b', 'LineWidth', 1.5)
% Corriente c: Negra
plot(t_corr, i_c, 'k', 'LineWidth', 1.5)
grid on
hold off

% 4. Títulos y etiquetas
title('Corrientes del Estator: i_a(t), i_b(t), i_c(t)')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')

% Leyenda
legend('i_a', 'i_b', 'i_c', 'Location', 'best')

% 5. Configuración del eje X (ajustado a toda la simulación por defecto)
xlim([0 max(t_corr)])
% ... existing code ...
% Leyenda
legend('i_a', 'i_b', 'i_c', 'Location', 'best')

% 5. --- Configuración específica del ZOOM ---
% Límite y pasos del eje X (Tiempo: de 1 a 1.026 con paso de 0.002)
xlim([1 1.026])
xticks(1:0.002:1.026)

% Límite y pasos del eje Y (Corrientes: de -800 a 600 con paso de 200)
ylim([-800 600])
yticks(-800:200:600)

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
xlim([1 1.026])
xticks(1:0.002:1.026)
