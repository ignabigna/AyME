g = 9.80665;
%====Parametros referidos a la carga(brazo robotico)==== 
%=======================================================
%COEFICIENTE DE FIRCCION VISCOSA ARTICULACION variable
b_lmax = 0.3; % variacion positiva
b_lmin = -0.3; % variacion negativa
b_l = (0.1 + b_lmax); % coeficiente de friccion viscosa de articulacion [N.m/rad.s]
%==============================================
m = 1; %masa del brazo manipulador [kg]
l_cm = 0.25; % longitud al centro de masa [m]
J_cm = 0.0208; % inercia equivalente [kg.m^2]
l_l = 0.50; % longitud total (extremo) [m]
%========================================
%masa de carga en el extremo variable
m_lmax = 1.5; % maxima carga
m_lmin = 0; % minima carga
m_l = m_lmax; % modificar puede ser valores intermedios
%=========================================
%momento de inercia total al eje de rotacion
J_l = (m*(l_cm^2) + J_cm) + m_l*(l_l^2); % no modificar aca, modificar arriba m_l (carga en el extremo)
k_l = m*l_cm + m_l*l_l; % cte que usamos en T_l(t): torque de carga
%==========================================
%Torque de perturbacion por contacto (asumir funcion escalon)
T_ldmin = -5; 
T_ldmax = 5; 
T_ld = T_ldmax; % variar por T_ldmax o T_ldmin [N.m]

%==========================================
%==========TREN DE TRANSMICION=============
r = 120; % realacion de reduccion
%==========================================
%==Especificaciones de operacion (brazo)===
n_lnom = 60; % velocidad nominal (salida) [rpm]
w_lnom = 6.28; % velocidad nominal (salida) [rad/s]
T_qnom = 17; % torque nominal (salida) [N.m]
T_qmax = 45; % torque pico [N.m]
%==========================================

%==========================================
%========Maquina electrica PMSM============
J_m = 14e-6; %momento de inercia (motor y caja)
b_m = 15e-6; %coeficiente de friccion (motor y caja)
P_p = 3; %pares de polos
lambda_m = 0.016; %Flujo magnético equivalente de imanes concatenado por espiras del bobinado de estator
L_q = 5.8e-3; % Inductancia del estator (eje en cuadratura)
L_d = 6.6e-3; % Inductancia del estator (eje directo)
L_ls = 0.8e-3; % Inductancia de disercion de estator
R_sREF = 1.02; %Resistencia de referencia de estator a T_sREF = 20 GRADOS
T_sREF = 20; % Temperatura de referencia
alpha_Cu = 3.9e-3; % coef aumento de R_s con T_s
%T_s;
%R_s = R_sREF*(1 + alpha_Cu*(T_s - T_sREF));
C_ts = 0.818; % capacitancia termica del estator
R_tsamb = 146.7; % resistencia termica estator-ambiente
tau_tsamb = R_tsamb*C_ts; %cte de tiempo termica

%==============================================
%===especificaciones de operacion (motor)======
n_mnom = 6600; %velocidad nominal rotor [rpm]
w_nnom = 691.15; %velocidad nominal rotor [rad/s]
V_slnom = 30; % tension nominal de linea 
V_sfnom = V_slnom/sqrt(3); %tension niminal de fase
I_snom = 0.4; %corriente nominal
I_smax = 2; %correinte maxima
T_smax = 115; % temperatura maxima bibinado estator
T_amb = 20; % temperatura ambiente, variable entre -15 y 40

%===============================================
%======calculo de J_eq y b_eq ==================
J_eq = J_m + J_l/r^2; % inercia equivalente visto desde el eje del motor
b_eq = b_m + b_l/r^2; % coeficiente de friccion equivalente visto desde el eje del motor
