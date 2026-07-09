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

% % --- Configuración específica del ZOOM ---
% % Límite y pasos del eje X (Tiempo: de 1 a 1.026 con paso de 0.002)
% xlim([1 1.026])
% xticks(1:0.002:1.026)
% 
% % Límite y pasos del eje Y (Posición: de -1 a 12 con paso de 2)
% ylim([-1 12])
% yticks(-1:2:12)

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

% % 5. --- Configuración específica del ZOOM ---
% % Límite y pasos del eje X (Tiempo: de 1 a 1.026 con paso de 0.002)
% xlim([1 1.026])
% xticks(1:0.002:1.026)
% 
% % Límite y pasos del eje Y (Corrientes: de -800 a 600 con paso de 200)
% ylim([-800 600])
% yticks(-800:200:600)

% STREAMING_CHUNK: Configurando extracción de datos...
%% Gráfico de las Tensión que salen del Modulador (Va, Vb, Vc) desde un Mux triple

% 1. Extraemos el tiempo y la matriz de datos de tensión
% El bloque to workspace se llama 'cons_ten_modul'
t_ten = out.mod_no_ideal.Time;
matriz_tensiones = out.mod_no_ideal.Data;

% STREAMING_CHUNK: Separando las variables...
% 2. Separamos las variables (según el orden de conexión al Mux: Va*, Vb*, Vc*)
v_a = matriz_tensiones(:, 1); % 1ra entrada: Consigna tensión fase a (Va*)
v_b = matriz_tensiones(:, 2); % 2da entrada: Consigna tensión fase b (Vb*)
v_c = matriz_tensiones(:, 3); % 3ra entrada: Consigna tensión fase c (Vc*)

% STREAMING_CHUNK: Ploteando las señales...
% 3. Creamos la figura y ploteamos
figure;

% Consigna Va*: Roja
plot(t_ten, v_a, 'r', 'LineWidth', 1.5)
hold on
% Consigna Vb*: Azul
plot(t_ten, v_b, 'b', 'LineWidth', 1.5)
% Consigna Vc*: Negra
plot(t_ten, v_c, 'k', 'LineWidth', 1.5)
grid on
hold off

% STREAMING_CHUNK: Añadiendo títulos y leyenda...
% 4. Títulos y etiquetas
title('Modulador de Tensión no ideal: v_a(t), v_b(t), v_c(t)')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')

% Leyenda (usando intérprete para que el asterisco quede como superíndice)
legend('v_a', 'v_b', 'v_c', 'Location', 'best')

% 5. Configuración del eje X (ajustado a toda la simulación por defecto)
xlim([0 max(t_ten)])
figure;

% Consigna Va*: Roja
plot(t_ten, v_a, 'r', 'LineWidth', 1.5)
hold on
% Consigna Vb*: Azul
plot(t_ten, v_b, 'b', 'LineWidth', 1.5)
% Consigna Vc*: Negra
plot(t_ten, v_c, 'k', 'LineWidth', 1.5)
grid on
hold off

% STREAMING_CHUNK: Añadiendo títulos y leyenda...
% 4. Títulos y etiquetas
title('Modulador de Tensión no ideal: v_a(t), v_b(t), v_c(t)')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')

% Leyenda (usando intérprete para que el asterisco quede como superíndice)
legend('v_a', 'v_b', 'v_c', 'Location', 'best')
% 5. --- Configuración específica del ZOOM ---
% Límite y pasos del eje X (Tiempo: de 1 a 1.026 con paso de 0.002)
xlim([0.995 1.04])
xticks(0.995:0.005:1.04)

% Límite y pasos del eje Y (Corrientes: de -800 a 600 con paso de 200)
ylim([-40 40])
yticks(-40:10:40)

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

% % 4. Configuración del eje X (ZOOM aplicado)
% % Límite y pasos del eje X (Tiempo: de 1 a 1.026 con paso de 0.002)
% xlim([1 1.026])
% xticks(1:0.002:1.026)