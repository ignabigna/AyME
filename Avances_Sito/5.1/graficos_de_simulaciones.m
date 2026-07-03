%% Miemos vector de tiempo para todos los plots
t = out.ref_Vqs.Time;
%% Plot Vqs* y Perturbacion
ref_Vqs = out.ref_Vqs.Data;
pert = out.pert.Data;
figure;
subplot(2,1,1)
plot(t, ref_Vqs, 'LineWidth', 1.5)
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
%% Plot torque vs velocidad
% 
% figure;
% 
% plot(omega, T_m, 'LineWidth',1.5)
% grid on
% title('Curva paramétrica torque electromagnético vs velocidad angular')
% xlabel('\omega_{m}(t) [rad/s]')
% ylabel('T_{m}(t) [N.m]')
% %xticks(-1:0.1:max(t))
% 1. Crear la figura y retenerla para encimar múltiples elementos
figure;
hold on;

% 2. Definir los límites del gráfico (basado en tu imagen anterior)
% Si en el futuro tenés torques o velocidades más altas, ajustá estos valores
x_max = 500;  x_min = -500;
y_max = 1;    y_min = -1;

% 3. Pintar los Cuadrantes usando "fill"
% La propiedad 'FaceAlpha' le da transparencia (0.1 = 10% opaco)
% La propiedad 'EdgeColor' en 'none' quita los bordes del rectángulo

% Cuadrante I: Arriba a la derecha (Rojo)
fill([0, x_max, x_max, 0], [0, 0, y_max, y_max], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'none');

% Cuadrante II: Arriba a la izquierda (Azul)
fill([x_min, 0, 0, x_min], [0, 0, y_max, y_max], 'b', 'FaceAlpha', 0.1, 'EdgeColor', 'none');

% Cuadrante III: Abajo a la izquierda (Verde)
fill([x_min, 0, 0, x_min], [y_min, y_min, 0, 0], 'g', 'FaceAlpha', 0.1, 'EdgeColor', 'none');

% Cuadrante IV: Abajo a la derecha (Amarillo)
fill([0, x_max, x_max, 0], [y_min, y_min, 0, 0], 'y', 'FaceAlpha', 0.1, 'EdgeColor', 'none');

% 4. Graficar tu curva original ENCIMA de los fondos de colores
% Asegurate de usar las variables correctas (ej. omega, Tm)
% Le ponemos un LineWidth de 1.5 para que la curva resalte bien sobre el color
plot(omega, T_m, 'LineWidth', 1.5, 'Color', [0 0.4470 0.7410]); 

% 5. Agregar las etiquetas de texto en el centro de cada cuadrante
% Se usan coordenadas (X, Y) para ubicar el texto
text(250, 0.5, {'Cuadrante I', 'Motorización Directa'}, ...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold');
    
text(-250, 0.5, {'Cuadrante II', 'Frenado Reg. Inverso'}, ...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold');
    
text(-250, -0.5, {'Cuadrante III', 'Motorización Inversa'}, ...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold');
    
text(250, -0.5, {'Cuadrante IV', 'Frenado Reg. Directo'}, ...
    'HorizontalAlignment', 'center', 'FontWeight', 'bold');

% 6. Ajustes de formato finales para que quede prolijo
grid on;
box on;
xlabel('\omega_m(t) [rad/s]');
ylabel('T_m(t) [N.m]');
title('Curva paramétrica: Torque vs Velocidad angular');
axis([x_min x_max y_min y_max]); % Fijamos los ejes para que calcen perfecto con el color

hold off;

%% Plot temeratura del estator


figure;

plot(i_qs, i_ds, 'LineWidth',1.5)
grid on
title('Plano de correintes i_{ds} vs i_{qs}')
xlabel('i_{qs} [A]')
ylabel('i_{ds} [A]')