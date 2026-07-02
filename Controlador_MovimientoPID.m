%===============================================
definicion_cte
zitta = 0.75;
w_n = 800; % Rad/seg
%======Datos Lazo abierto ===========
%--- CONDICIONES MÍNIMAS (Nominales) ---
%Temp = 25.0 °C | Rs = 1.0399 ohms | Jeq = 1.98e-05 | beq = 2.19e-05
s1_Nmin = 0.00;
s2_Nmin = -90.20 + 148.93i;
s3_Nmin = -90.20 - 148.93i;

%00000000000000000000000000000000000000000000000

%======Controlador de Movimiento PID ===========
K_d = J_eq * (w_n) * (1 + (2 * zitta)) - b_eq;
K_p = J_eq * (w_n^2) * (1 + (2 * zitta));
K_i = J_eq * (w_n^3);
%xxxxxxxxxxxxxxxxxxxxxx

%======Controlador de Movimiento PID max y min ==========
K_dmax = J_eq_max * (w_n) * (1 + (2 * zitta)) - b_eq_max;
K_pmax = J_eq_max * (w_n^2) * (1 + (2 * zitta));
K_imax = J_eq_max * (w_n^3);

K_dmin = J_eq_min * (w_n) * (1 + (2 * zitta)) - b_eq_min;
K_pmin = J_eq_min * (w_n^2) * (1 + (2 * zitta));
K_imin = J_eq_min * (w_n^3);
%======Cálculo de Polos (Carga Nominal)==========

coef_nom = [J_eq, (b_eq + K_d), K_p, K_i];
polos_nom = roots(coef_nom);

s1 = polos_nom(1);
s2 = polos_nom(2);
s3 = polos_nom(3);

fprintf('Polos Lazo Cerrado (Carga Nominal):\n');
fprintf('s1 = %.2f\n', real(s1));
fprintf('s2 = %.2f + %.2fi\n', real(s2), abs(imag(s2)));
fprintf('s3 = %.2f - %.2fi\n', real(s3), abs(imag(s3)));


%======Cálculo de Polos (Carga Maxima)==========
coef_max = [J_eq_max, (b_eq_max + K_dmax), K_pmax, K_imax];
polos_max = roots(coef_max);

s1_max = polos_max(1);
s2_max = polos_max(2);
s3_max = polos_max(3);

% 3. Mostrar los resultados limpios en la Command Window
fprintf('Polos (Carga Máxima):\n');
fprintf('s1 = %.2f\n', s1_max);
fprintf('s2 = %.2f + %.2fi\n', real(s2_max), abs(imag(s2_max)));
fprintf('s3 = %.2f - %.2fi\n', real(s3_max), abs(imag(s3_max)));

%======Cálculo de Polos (Carga Minima)==========

coef_min = [J_eq_min, (b_eq_min + K_dmin), K_pmin, K_imin];
polos_min = roots(coef_min);

s1_min = polos_min(1);
s2_min = polos_min(2);
s3_min = polos_min(3);

% 3. Mostrar los resultados limpios en la Command Window
fprintf('Polos (Carga Mínima):\n');
fprintf('s1 = %.2f\n', s1_min);
fprintf('s2 = %.2f + %.2fi\n', real(s2_min), abs(imag(s2_min)));
fprintf('s3 = %.2f - %.2fi\n', real(s3_min), abs(imag(s3_min)));

%===============================================
%====== GRÁFICOS DE POLOS ======================
%===============================================

% --- 1. Gráfico de Polos: Nominal (SIN lazo de corriente) ---
% Ideal para mostrar el detalle de cómo el PID mueve los polos mecánicos
figure(1);
hold on; grid on;

% Lazo Abierto (Condición Mínima/Nominal) -> Negro, cruces
plot(real([s1_Nmin, s2_Nmin, s3_Nmin]), imag([s1_Nmin, s2_Nmin, s3_Nmin]), ...
    'kx', 'MarkerSize', 12, 'LineWidth', 2, 'DisplayName', 'Lazo Abierto Nominal');

% Lazo Cerrado (Con PID) -> Azul, círculos
plot(real([s1, s2, s3]), imag([s1, s2, s3]), ...
    'bo', 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Lazo Cerrado');

title('Mapa de Polos - Condición Nominal (Detalle Dinámica Mecánica)');
xlabel('Eje Real (\sigma)');
ylabel('Eje Imaginario (j\omega)');
legend('Location', 'best');
xline(0, 'k-', 'LineWidth', 1); % Eje vertical (Límite de estabilidad)
yline(0, 'k-', 'LineWidth', 1); % Eje horizontal
hold off;


% --- 2. Gráfico de Polos: Nominal (CON lazo de corriente) ---
% Ideal para justificar la separación de dinámicas (polos dominantes vs rápidos)
figure(2);
hold on; grid on;

% Lazo Abierto (Condición Mínima/Nominal) -> Negro, cruces
plot(real([s1_Nmin, s2_Nmin, s3_Nmin]), imag([s1_Nmin, s2_Nmin, s3_Nmin]), ...
    'kx', 'MarkerSize', 12, 'LineWidth', 2, 'DisplayName', 'Lazo Abierto Nominal');

% Lazo Cerrado (Con PID) -> Azul, círculos
plot(real([s1, s2, s3]), imag([s1, s2, s3]), ...
    'bo', 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Lazo Cerrado');

% Lazo de Corriente (Proporcional) -> Verde, cuadrado
plot(-5000, 0, ...
    'gs', 'MarkerSize', 12, 'LineWidth', 2, 'DisplayName', 'Lazo de Corriente');

title('Mapa de Polos - Condición Nominal (Vista General con Lazo Interno)');
xlabel('Eje Real (\sigma)');
ylabel('Eje Imaginario (j\omega)');
legend('Location', 'best');
xline(0, 'k-', 'LineWidth', 1); % Eje vertical (Límite de estabilidad)
yline(0, 'k-', 'LineWidth', 1); % Eje horizontal
hold off;