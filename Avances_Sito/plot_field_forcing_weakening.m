%% Plot de torque y velocidad - reforzamiento y debilitamiento de campo

% 1. Extraemos los tiempos individuales de cada simulación
t_nom = out.omega.Time;
t_for = out.omega_field_forcing.Time;
t_deb = out.omega_field_weakening.Time;

% 2. Extraemos los datos
omega = out.omega.Data;
omega_field_forcing = out.omega_field_forcing.Data;
omega_field_weakening = out.omega_field_weakening.Data;

T_m = out.T_m.Data;
T_m_field_forcing = out.T_m_field_forcing.Data;
T_m_field_weakening = out.T_m_field_weakening.Data;

figure;

% --- Subplot 1: Velocidad ---
subplot(2,1,1)
% Ploteamos cada variable con su propio vector de tiempo
plot(t_nom, omega, 'k', 'LineWidth', 1.5)
hold on
plot(t_for, omega_field_forcing, 'r', 'LineWidth', 1.5)
plot(t_deb, omega_field_weakening, 'b', 'LineWidth', 1.5)
grid on
hold off % Es buena práctica "soltar" el gráfico al terminar

% Corregimos títulos y etiquetas
title('\omega(t) - Velocidad del Motor')
xlabel('Tiempo [s]')
ylabel('Velocidad [rad/s]') % Podés cambiarlo a [RPM] si tu señal sale en RPM
legend('Nominal', 'Reforzamiento de Campo', 'Debilitamiento de Campo', 'Location', 'best')
xlim([0 max(t_nom)]) % Opcional, para que la grilla quede prolija

% --- Subplot 2: Torque ---
subplot(2,1,2)
plot(t_nom, T_m, 'k', 'LineWidth', 1.5)
hold on
plot(t_for, T_m_field_forcing, 'r', 'LineWidth', 1.5)
plot(t_deb, T_m_field_weakening, 'b', 'LineWidth', 1.5)
grid on
hold off

% Corregimos títulos y etiquetas
title('T_m(t) - Torque Electromagnético')
xlabel('Tiempo [s]')
ylabel('Torque [N·m]')
legend('Nominal', 'Reforzamiento de Campo', 'Debilitamiento de Campo', 'Location', 'best')
xlim([0 max(t_nom)])

%% Plot de corrientes i_ds - Nominal, Reforzamiento y Debilitamiento de campo

% 1. Extraemos los vectores de tiempo individuales de cada objeto Timeseries
t_nom = out.i_ds.Time;
t_for = out.i_ds_forcing.Time;
t_deb = out.i_ds_weakening.Time;

% 2. Extraemos los datos numéricos de las corrientes
i_ds = out.i_ds.Data;
i_ds_forcing = out.i_ds_forcing.Data;
i_ds_weakening = out.i_ds_weakening.Data;

% 3. Creación del gráfico único
figure;

plot(t_nom, i_ds, 'k', 'LineWidth', 1.5)
hold on
plot(t_for, i_ds_forcing, 'r', 'LineWidth', 1.5)
plot(t_deb, i_ds_weakening, 'b', 'LineWidth', 1.5)
grid on
hold off % Soltamos la figura

% Títulos y etiquetas con formato correcto para el eje d
title('i_{ds}(t) - Corriente en el eje d')
xlabel('Tiempo [s]')
ylabel('Corriente [A]')

% Leyenda para identificar cada curva
legend('Nominal', 'Reforzamiento de Campo', 'Debilitamiento de Campo', 'Location', 'best')

% Configuración de la grilla cada 0.1 segundos y límites del eje X
xticks(0:0.1:max(t_nom))
xlim([0 max(t_nom)])