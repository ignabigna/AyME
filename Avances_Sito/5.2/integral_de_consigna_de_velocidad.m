% 1. Definir el vector de tiempo con paso de 0.001 hasta 14 segundos
dt = 0.001; 
t = 0:dt:14; 

% 2. Definir los puntos clave de la función trapezoidal
% t_puntos son los instantes de tiempo de los cambios
% y_puntos son los valores de la función en esos instantes
t_puntos = [0,   1, 1.1, 5.9, 6, 8,  8.1, 12.9, 13, 14];
y_puntos = [0,   0, 150, 150, 0, 0, -150, -150,  0,  0];

% 3. Interpolar para generar la señal 'y' en cada instante de 't'
% 'interp1' conecta los puntos clave con líneas rectas automáticamente
y = interp1(t_puntos, y_puntos, t);

% 4. Integrar numéricamente usando el método del trapecio acumulativo
integral_y = cumtrapz(t, y);

% 5. Graficar los resultados para verificar
figure;

% Gráfica de la señal trapezoidal
subplot(2,1,1);
plot(t, y, 'b', 'LineWidth', 2);
title('Señal Trapezoidal Original');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
ylim([-180 180]); % Ajustamos los límites de Y para que se vea bien

% Gráfica de la integral
subplot(2,1,2);
plot(t, integral_y, 'r', 'LineWidth', 2);
title('Integral de la Señal Trapezoidal');
xlabel('Tiempo (s)');
ylabel('Valor Acumulado');
grid on;

% 1. Asegurarse de que los vectores sean columnas usando la comilla simple (')
t_col = t'; 
integral_col = integral_y';

% 2. Crear el objeto timeseries
theta_m_Referencia = timeseries(integral_col, t_col, 'Name', 'IntegralTrapezoidal');


% 3. Guardarlo en un archivo .mat en tu disco duro
save('datos_Referencia_posicion.mat', 'theta_m_Referencia');

disp('Archivo timeseries guardado con éxito.');