function [t, v_qs, T_L] = G_Entradas()

%% Tiempo
t = 0:0.001:2;   % 0 a 2 segundos

%% Inicialización
v_qs = zeros(size(t));
T_L  = zeros(size(t));

%% ---------------------------
% --- Señal v_qs(t) ---
for k = 1:length(t)
    if t(k) >= 0.1 && t(k) < 0.7
        v_qs(k) = 19.596;
    elseif t(k) >= 0.7 && t(k) < 1.1
        v_qs(k) = 0;
    elseif t(k) >= 1.1 && t(k) < 1.7
        v_qs(k) = -19.596;        
    else
        v_qs(k) = 0;
    end
end

% --- Señal T_L(t) ---
for k = 1:length(t)
    if t(k) >= 0.3 && t(k) < 0.5
        T_L(k) = 6.28;
    elseif t(k) >= 0.5 && t(k) < 0.9
        T_L(k) = -6.28;
    elseif t(k) >= 1.3 && t(k) < 1.5
        T_L(k) = 6.28;
    elseif t(k) >= 1.5 && t(k) < 1.9
        T_L(k) = -6.28;
    else
        T_L(k) = 0;
    end
end
%% ---------------------------
% Gráficos
% ---------------------------

figure;

subplot(2,1,1)
plot(t, v_qs, 'LineWidth', 1.5)
grid on
title('Señal V^{*}_{qs}(t)')
xlabel('Tiempo [s]')
ylabel('Voltaje [V]')

subplot(2,1,2)
plot(t, T_L, 'LineWidth', 1.5)
grid on
title('Torque de carga T_L(t)')
xlabel('Tiempo [s]')
ylabel('Torque [N·m]')
end