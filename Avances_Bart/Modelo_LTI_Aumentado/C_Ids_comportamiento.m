% =========================================================================
% Gráfica de i_ds(t) para distintas condiciones iniciales
% Ecuación: i_ds(t) = i_ds(0) * exp(-(Rs/Ld)*t)
% =========================================================================
i_q     = out.IQS.Data;
i_d     = out.IDS.Data;
% 1. Parámetros del motor
Rs = 1.02;    % Resistencia de fase del estator [Ohms]
Ld = 6.6e-3;  % Inductancia de eje directo [H]
% Constante de tiempo eléctrica
tau = Ld / Rs;

% 2. Vector de tiempo
% Graficamos desde t=0 hasta 5 veces tau (cuando decae al ~99%)
t = linspace(0, 15*tau, 1000); 

% 3. Condiciones Iniciales solicitadas
i0_1 = 0;   % Condición nominal
i0_2 = 0.5;   % Perturbación positiva
i0_3 = -0.5;  % Perturbación negativa

% 4. Cálculo de las exponenciales
ids_1 = i0_1 * exp(-(Rs/Ld) * t);
ids_2 = i0_2 * exp(-(Rs/Ld) * t);
ids_3 = i0_3 * exp(-(Rs/Ld) * t);

% 5. Creación de la gráfica
figure('Name', 'Dinámica de i_ds(t)', 'Color', 'w');

% Graficamos las 3 curvas
plot(t, ids_1, 'k', 'LineWidth', 2); hold on; % Línea negra para 0A
plot(t, ids_2, 'b', 'LineWidth', 2);          % Línea azul para 5A
plot(t, ids_3, 'r', 'LineWidth', 2);          % Línea roja para -5A

% Formato y estética
grid on;
title('Respuesta transitoria de la corriente i_{ds}(t)');
xlabel('Tiempo [s]');
ylabel('Corriente de eje directo i_{ds}^r [A]');

% Leyenda para identificar cada curva
legend('i_{ds}(0) = 0 A', ...
       'i_{ds}(0) = 0.5 A', ...
       'i_{ds}(0) = -0.5 A', 'Location', 'best');

% Tareas finales
hold off;