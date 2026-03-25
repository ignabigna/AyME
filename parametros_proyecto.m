% ============================================================
% PARAMETROS DEL PROYECTO AYME
% ============================================================
clear
clc

g = 9.80665;

Jm = 14e-6;
bm = 15e-6;

m_brazo = 1.0;
m_carga_min = 0.0;
m_carga_max = 1.5;

b_art_nom = 0.1;
b_art_var = 0.03;

lambda_m = 0.016;

Ld = 6.6e-3;
Lq = 5.8e-3;

Rth = 146.7;

Tamb = 25;
Tamb_min = -15;
Tamb_max = 40;

Tmax = 115;

theta0 = 0;
omega0 = 0;

id0 = 0;
iq0 = 0;

Ts0 = 25;
cts = 0.818;               % [J/°C] capacidad termica estator
Rts_amb = 146.7;           % [°C/W] resistencia termica estator-ambiente

tau_ts = Rts_amb * cts;    % [s] constante de tiempo termica (~120 s)

%% ============================================================
% PARAMETROS ELECTROMAGNETICOS
%% ============================================================ Estoss habria quw chequear Eze, pero creoq ue estan bien
P_p = 3;                 % pares de polos (dado)
R_s = 1.02;              % ohm (dado)
r = 120;                 % relación (dado)
J_eq = 1.98e-5;          % kg*m^2 (calculado desde datos reales)

% ============================================================
lambda_m = 0.016;          % [Wb] flujo equivalente de imanes

Ld = 6.6e-3;               % [H] inductancia eje d
Lq = 5.8e-3;               % [H] inductancia eje q
Lls = 0.8e-3;              % [H] inductancia de dispersion estator

Rs_ref = 1.02;             % [ohm] resistencia de fase a T_ref
T_ref = 20;                % [°C] temperatura de referencia

alpha_cu = 3.9e-3;        % [1/°C] coeficiente termico del cobre

%% ============================================================
% PARAMETROS TERMICOS
% ============================================================

cts = 0.818;               % [J/°C] capacidad termica estator
Rts_amb = 146.7;           % [°C/W] resistencia termica estator-ambiente

tau_ts = Rts_amb * cts;    % [s] constante de tiempo termica (~120 s)

%% ============================================================
% LIMITES DE OPERACION
% ============================================================

n_nom = 6600;              % [rpm] velocidad nominal rotor
omega_nom = 691.15;        % [rad/s] velocidad nominal

Vsl_nom = 30;              % [V_rms] tension nominal de linea
Vsf_nom = Vsl_nom/sqrt(3); % [V_rms] tension nominal de fase

Is_nom = 0.4;              % [A_rms] corriente nominal
Is_max = 2.0;              % [A_rms] corriente maxima

Ts_max = 115;              % [°C] temperatura maxima bobinado

Tamb_min = -15;            % [°C]
Tamb_max = 40;             % [°C]
Tamb = 25;                 % [°C] valor nominal para simulacion

%% ============================================================
% CONDICIONES INICIALES
% ============================================================

theta0 = 0;                % [rad]
omega0 = 0;                % [rad/s]

id0 = 0;                   % [A]
iq0 = 0;                   % [A]

Ts0 = 25;                  % [°C]

% ============================================================
% CALCULO DINAMICO DE INERCIA Y CARGA (Referido al motor)
% ============================================================
% --- Variables faltantes extraídas del PDF ---
l_cm = 0.25;                % [m] Longitud al centro de masa 
J_cm = 0.0208;              % [kg.m^2] Inercia equivalente (centro de masa) 
l_l = 0.50;                 % [m] Longitud total (extremo) 
ml = 0.0;                   % [kg] Masa de carga útil (rango 0 a 1.5) 

% --- Cálculos de compactación (Punto 5.1.1) ---
% Inercia de la carga en la articulación (Ec. 1.2)
Jl = (m_brazo * l_cm^2 + J_cm) + ml * l_l^2; % 
% Inercia equivalente total vista por el motor
J_eq = Jm + (Jl / r^2); % 
% Coeficiente kl para el torque gravitacional (Ec. 1.1)
kl = m_brazo * l_cm + ml * l_l; 
% Fricción viscosa equivalente referida al motor
b_eq = bm + (b_art_nom / r^2); 

%%Corrida
graficar_polos_temperatura(Ld, Lq, Rs_ref, alpha_cu, T_ref, P_p, lambda_m, J_eq, b_eq, Tamb_min, Ts_max);
%% Corrida de Desempeño
graficar_desempeno_carga(Lq, Rs_ref, alpha_cu, T_ref, Tamb_min, Ts_max, P_p, lambda_m, Jm, bm, r, m_brazo, l_cm, J_cm, l_l, m_carga_min, m_carga_max, b_art_nom, b_art_var);