%% Calculo angulo de torque
% Asumo que tenés en tu Workspace los vectores de tiempo y variables:
% tout (tiempo), Va, Vb, Vc (tensiones), theta_m (posición mecánica) y Pp (pares de polos)
t = out.v_a.Time;
v_a = out.v_a.Data;
v_b = out.v_b.Data;
v_c = out.v_c.Data;

% 1. Aplicar la Transformada de Clarke (Ec. 93)
V_alpha = (2/3) * (v_a - 0.5*v_b - 0.5*v_c);
V_beta  = (2/3) * (0*v_a + (sqrt(3)/2)*v_b - (sqrt(3)/2)*v_c);

% 2. Calcular el ángulo del vector de tensión del estator (Ec. 94)
theta_ev = atan2(V_beta, V_alpha);

% 3. obtengo el ángulo eléctrico del rotor
theta_r = out.theta_r.Data;

% 4. Calcular el Ángulo de Torque (Delta)
% (Se suele usar la función mod o wrapToPi para mantenerlo entre -pi y pi)
delta = theta_ev - theta_r;
delta_pi = wrapToPi(delta); % Mantiene el ángulo en el rango de -180 a 180 grados

% 5. Graficar
figure;
plot(t, rad2deg(delta_pi), 'LineWidth', 1.5);
grid on;
title('Ángulo de Torque del Rotor (\delta) vs. Tiempo');
xlabel('Tiempo [s]');
ylabel('Ángulo de Torque [Grados]');