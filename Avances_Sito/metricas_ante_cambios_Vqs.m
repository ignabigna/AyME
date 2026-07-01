% =========================================================================
% SCRIPT DE ANÁLISIS DE TRANSITORIOS (Vqs*)
% =========================================================================

% 1. Extraemos los datos generales del Workspace una sola vez
tout  = out.omega.Time; 
omega = out.omega.Data;
i_q   = out.i_qs.Data;

%% EVENTO 1: Primer Escalón en Vqs*
t_in_1  = 0.1; % MODIFICAR: Tiempo de inicio del evento 1
t_fin_1 = 0.3; % MODIFICAR: Tiempo de fin del evento 1

idx1 = (tout >= t_in_1) & (tout <= t_fin_1);
analizar_y_mostrar('EVENTO 1', tout(idx1), omega(idx1), i_q(idx1));

%% EVENTO 2: Segundo Escalón en Vqs*
t_in_2  = 0.7; % MODIFICAR: Tiempo de inicio del evento 2
t_fin_2 = 0.9; % MODIFICAR: Tiempo de fin del evento 2

idx2 = (tout >= t_in_2) & (tout <= t_fin_2);
analizar_y_mostrar('EVENTO 2', tout(idx2), omega(idx2), i_q(idx2));

%% EVENTO 3: Tercer Escalón en Vqs*
t_in_3  = 1.1; % MODIFICAR: Tiempo de inicio del evento 3
t_fin_3 = 1.3; % MODIFICAR: Tiempo de fin del evento 3

idx3 = (tout >= t_in_3) & (tout <= t_fin_3);
analizar_y_mostrar('EVENTO 3', tout(idx3), omega(idx3), i_q(idx3));

%% EVENTO 4: Cuarto Escalón en Vqs*
t_in_4  = 1.7; % MODIFICAR: Tiempo de inicio del evento 4
t_fin_4 = 1.9; % MODIFICAR: Tiempo de fin del evento 4

idx4 = (tout >= t_in_4) & (tout <= t_fin_4);
analizar_y_mostrar('EVENTO 4', tout(idx4), omega(idx4), i_q(idx4));


% =========================================================================
% FUNCIONES AUXILIARES 
% =========================================================================

function analizar_y_mostrar(nombre_evento, t, w, iq)
    % Esta función formatea e imprime los resultados en la terminal
    disp('======================================================')
    fprintf('   MÉTRICAS: %s (%.2fs - %.2fs)\n', nombre_evento, t(1), t(end));
    disp('======================================================')

    % Cálculos para Velocidad
    [w_fin, w_tr, w_ts, w_os] = calcular_metricas_manuales(t, w);
    
        % Buscamos el pico de la velocidad según la dirección del transitorio
    if w_fin >= w(1)
        w_pico = max(w); % Si acelera, el pico es el punto más alto
    else
        w_pico = min(w); % Si frena (carga), el pico es el punto más bajo del pozo
    end

    disp('--> VELOCIDAD (\omega_m):')
    fprintf('  Valor final estabilizado    : %.4f rad/s\n', w_fin);
    fprintf('  Valor pico dinámico         : %.4f rad/s\n', w_pico);
    fprintf('  Tiempo de crecimiento (10-90%%): %.4f s\n', w_tr);
    fprintf('  Tiempo de establecimiento (1%%): %.4f s (absoluto)\n', w_ts);
    fprintf('  Sobrepico dinámico          : %.2f %%\n\n', w_os);

    % Cálculos para Corriente
    % Ignoramos tr y ts usando el símbolo "~" para no guardar esas variables
    [iq_fin, ~, ~, iq_os] = calcular_metricas_manuales(t, iq);
    
    % Buscamos el valor pico absoluto de la corriente en este recorte
    [~, idx_pico] = max(abs(iq));
    iq_pico = iq(idx_pico);

    disp('--> CORRIENTE (i_q):')
    fprintf('  Valor final estabilizado    : %.4f A\n', iq_fin);
    fprintf('  Valor pico dinámico         : %.4f A\n', iq_pico);
    fprintf('  Sobrepico dinámico          : %.2f %%\n', iq_os);
    disp('------------------------------------------------------')
end

function [y_fin, tr, ts, overshoot] = calcular_metricas_manuales(t, y)
    % 1. Valores base
    y_ini = y(1);
    y_fin = y(end);
    amp_escalon = abs(y_fin - y_ini);

    % 2. Tiempo de Establecimiento usando stepinfo (con traslación segura)
    y_shifted = y - y_ini;
    info = stepinfo(y_shifted, t, 'SettlingTimeThreshold', 0.01);
    ts = info.SettlingTime;

    % Si la amplitud es cero (no hubo cambio real), evitamos dividir por cero
    if amp_escalon < 1e-4
        tr = 0; overshoot = 0; return;
    end

    % 3. Sobrepico y Tiempo de Crecimiento (10-90%) Manuales
    if y_fin >= y_ini 
        % --- ESCALÓN HACIA ARRIBA (Aceleración) ---
        overshoot = max(0, max(y) - y_fin) / amp_escalon * 100;
        
        y10 = y_ini + 0.10 * amp_escalon;
        y90 = y_ini + 0.90 * amp_escalon;
        
        idx10 = find(y >= y10, 1);
        idx90 = find(y >= y90, 1);
        
    else 
        % --- ESCALÓN HACIA ABAJO (Frenado) ---
       overshoot = max(0, y_fin - min(y)) / amp_escalon * 100;
        
        y10 = y_ini - 0.10 * amp_escalon;
        y90 = y_ini - 0.90 * amp_escalon;
        
        idx10 = find(y <= y10, 1);
        idx90 = find(y <= y90, 1);
    end

    % Validación por si el recorte de tiempo es muy corto y no llegó al 90%
    if isempty(idx10) || isempty(idx90)
        tr = NaN; 
    else
        tr = t(idx90) - t(idx10);
    end
end