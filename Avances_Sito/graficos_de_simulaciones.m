%% Miemos vector de tiempo para todos los plots
t = out.Vqs.Time;
%% Plot Vqs* y Perturbacion
Vqs = out.Vqs.Data;
pert = out.pert.Data;
figure;

subplot(2,1,1)
plot(t, Vqs, 'LineWidth', 1.5)
grid on
title('Señal V^{*}_{qs}(t)')
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')
xticks(0:0.1:max(t))

subplot(2,1,2)
plot(t, pert, 'LineWidth', 1.5)
grid on
title('Torque de carga T_L(t)')
xlabel('Tiempo [s]')
ylabel('Torque [N·m]')
% Forzar marcas y grilla en el eje X cada 0.1 segundos
xticks(0:0.1:max(t))

%% Plot posicion, velocidad y torque
theta = out.theta.Data;
omega = out.omega.Data;
T_m = out.T_m.Data;

figure; 


subplot(3,1,1)
plot(t, theta, 'LineWidth',1.5)
grid on
title('\theta_m(t) - Posición angular')
xlabel('Tiempo [s]')
ylabel('Posición [rad]')
xticks(0:0.1:max(t))

subplot(3,1,2)
plot(t, omega, 'LineWidth',1.5)
grid on
title('\omega_m(t) - Velocidad angular')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]')
xticks(0:0.1:max(t))

subplot(3,1,3)
plot(t, T_m, 'LineWidth',1.5)
grid on
title('T_m(t) - Torque electromagnético')
xlabel('Tiempo [s]')
ylabel('Torque [N·m]')
xticks(0:0.1:max(t))

%% Plot temeratura del estator
T_s = out.T_s.Data;

figure;

plot(t, T_s, 'LineWidth',1.5)
grid on
title('T_s(t) - Temperratura del bobinado del estator')
xlabel('Tiempo [s]')
ylabel('Temperatura [°C]')
xticks(0:0.1:max(t))

%% Plot iq, id, i0
i_qs = out.i_qs.Data;
i_ds = out.i_ds.Data;
i_0s = out.i_0s.Data;

figure; 

subplot(3,1,1)
plot(t, i_qs, 'LineWidth',1.5)
grid on
title('i_{qs}(t) - Correinte eje q')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:0.1:max(t))

subplot(3,1,2)
plot(t, i_ds, 'LineWidth',1.5)
grid on
title('i_{ds}(t) - Correinte eje d')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:0.1:max(t))

subplot(3,1,3)
plot(t, i_0s, 'LineWidth',1.5)
grid on
title('i_{0s}(t) - Correinte eje 0')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:0.1:max(t))

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
xticks(0:0.1:max(t))

subplot(3,1,2)
plot(t, i_b, 'LineWidth',1.5)
grid on
title('i_{b}(t) - Correinte de fase b')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:0.1:max(t))

subplot(3,1,3)
plot(t, i_c, 'LineWidth',1.5)
grid on
title('i_{c}(t) - Correinte de fase c')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')
xticks(0:0.1:max(t))

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
xticks(0:0.1:max(t))

subplot(3,1,2)
plot(t, v_b, 'LineWidth',1.5)
grid on
title('V_{b}(t) - Tensión de fase b')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
xticks(0:0.1:max(t))

subplot(3,1,3)
plot(t, v_c, 'LineWidth',1.5)
grid on
title('v_{c}(t) - Tensión de fase c')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
xticks(0:0.1:max(t))

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
xticks(0:0.1:max(t))

subplot(3,1,2)
plot(t, v_ds, 'LineWidth',1.5)
grid on
title('V_{ds}(t) - Tensión del eje d')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
xticks(0:0.1:max(t))

subplot(3,1,3)
plot(t, v_0s, 'LineWidth',1.5)
grid on
title('v_{0s}(t) - Tensión del eje 0')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
xticks(0:0.1:max(t))