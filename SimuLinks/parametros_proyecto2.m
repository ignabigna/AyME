%% ============================================================
% PARAMETROS DEL PROYECTO AYME
% ============================================================

clear
clc

%% ============================================================
% CONSTANTES FISICAS
% ============================================================

g = 9.81;                     % [m/s^2] gravedad

%% ============================================================
% PARAMETROS MECANICOS
% ============================================================

r = 120;          % [-] relacion de reduccion total
%% ============================================================
% PARAMETROS ELECTROMAGNETICOS DEL PMSM
% ============================================================

lambda_m = 0.016;             % [Wb] flujo magnetico equivalente de imanes

Ld = 6.6e-3;                  % [H] inductancia eje d
Lq = 5.8e-3;                  % [H] inductancia eje q
Lls = 0.8e-3;                 % [H] inductancia de dispersion

Rs_ref = 1.02;                % [Ohm] resistencia estator a T_ref
T_ref = 20;                   % [°C] temperatura de referencia

alpha_cu = 3.9e-3;            % [1/°C] coeficiente termico del cobre

%% ============================================================
% PARAMETROS TERMICOS
% ============================================================

Cts = 0.818;                  % [J/°C] capacidad termica estator
Rts_amb = 146.7;              % [°C/W] resistencia termica estator-ambiente

tau_ts = Rts_amb*Cts;         % [s] constante de tiempo termica (~120 s)

Ts_max = 115;                 % [°C] temperatura maxima bobinado

Tamb_min = -15;               % [°C] temperatura ambiente minima
Tamb_max = 40;                % [°C] temperatura ambiente maxima
Tamb = 25;                    % [°C] temperatura ambiente nominal

%% ============================================================
% ESPECIFICACIONES DE OPERACION
% ============================================================

n_nom = 6600;                 % [rpm] velocidad nominal rotor
omega_nom = 691.15;           % [rad/s] velocidad nominal

Vsl_nom = 30;                 % [V_rms] tension nominal de linea
Vsf_nom = Vsl_nom/sqrt(3);    % [V_rms] tension nominal de fase

Is_nom = 0.4;                 % [A_rms] corriente nominal
Is_max = 2.0;                 % [A_rms] corriente maxima

%% ============================================================
% PARAMETROS MECANICOS (si luego los necesitas)
% ============================================================

Jm = 14e-6;                   % [kg*m^2] inercia rotor
bm = 15e-6;                   % [N*m*s/rad] friccion viscosa

%% ============================================================
% CONDICIONES INICIALES
% ============================================================

theta0 = 0;                   % [rad] posicion inicial
omega0 = 0;                   % [rad/s] velocidad inicial

id0 = 0;                      % [A] corriente eje d
iq0 = 0;                      % [A] corriente eje q

Ts0 = 25;                     % [°C] temperatura inicial estator