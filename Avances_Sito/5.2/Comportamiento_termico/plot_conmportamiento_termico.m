%% Gráfico de Temperatura del Bobinado del Estator (T_s)
% Operación continua y repetitiva
% Condición: Coeficiente de fricción mínimo y masa de carga nula (0 kg)

% 1. Extraemos el tiempo y los datos de la variable T_s desde Simulink
t_temp = out.T_s.Time;
T_s = out.T_s.Data;

% 2. Creamos la figura
figure(1);

% Ploteamos la temperatura (usaremos color rojo para indicar temperatura)
plot(t_temp, T_s, 'r', 'LineWidth', 1.5)
hold on

% Agregamos la línea de temperatura máxima permitida
% (La variable T_smax debe estar previamente definida en el Workspace)
yline(T_smax, 'k--', 'LineWidth', 1.5); 
grid on
hold off

% 3. Títulos, etiquetas y leyenda
title('T_s(t) - Temperatura del bobinado del estator (Operación Continua)')
xlabel('Tiempo [s]')
ylabel('Temperatura [°C]') % Ajustar la unidad si tu modelo usa Kelvin (K)

% Agregamos la leyenda para identificar el límite
legend('Temperatura (T_s)', 'Límite Máximo (T_{smax})', 'Location', 'best')

% 4. Configuración de los ejes
% Ajustamos el eje X para que muestre toda la simulación
xlim([0 max(t_temp)])

