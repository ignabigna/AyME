function graficar_polos_temperatura2(Ld, Lq, Rs_ref, alpha_cu, T_ref, P_p, lambda_m, J_eq_min, b_eq_min, J_eq_max, b_eq_max, Tamb_min, Tamb_nom, Ts_max)

    % Rango de temperatura para el gráfico
    T = linspace(Tamb_min, Ts_max, 6);
    
    % Figura
    figure('Color', 'w'); hold on; grid on;
    for k = 1:length(T)
        
        % Resistencia dependiente de la temperatura
        Rs = Rs_ref*(1 + alpha_cu*(T(k) - T_ref));
        
        % Matriz A (Usamos los parámetros nominales/mínimos para el barrido)
        A = [ -Rs/Ld      0                  0                 0;
               0       -Rs/Lq     -(P_p*lambda_m)/Lq             0;
               0   (3/2)*(P_p*lambda_m)/J_eq_min   -b_eq_min/J_eq_min          0;
               0           0                  1                 0 ];
        
        % Polos
        polos = eig(A);
        
        % Graficar
        plot(real(polos), imag(polos), 'x', 'DisplayName', ...
            sprintf('R_s = %.3f \\Omega (T = %.1f °C)', Rs, T(k)), 'LineWidth', 1.5, 'MarkerSize', 8);
    end
    
    sgrid;
    xlabel('Parte real');
    ylabel('Parte imaginaria');
    title('Mapa de polos para distintos valores de temperatura');
    legend show;
    legend('Location','best');

    % --- LLAMADA A LA NUEVA FUNCIÓN PARA IMPRIMIR EN CONSOLA ---
    mostrar_polos_extremos(Lq, P_p, lambda_m, Rs_ref, alpha_cu, T_ref, Tamb_nom, Ts_max, J_eq_min, b_eq_min, J_eq_max, b_eq_max);

end

% =========================================================================
% FUNCIÓN AUXILIAR PARA CALCULAR Y MOSTRAR S1, S2, S3
% =========================================================================
function mostrar_polos_extremos(Lq, P_p, lambda_m, Rs_ref, alpha_cu, T_ref, Tamb_nom, Ts_max, J_eq_min, b_eq_min, J_eq_max, b_eq_max)
    
    % 1. Calcular resistencias en los extremos
    Rs_nom = Rs_ref * (1 + alpha_cu * (Tamb_nom - T_ref));
    Rs_max = Rs_ref * (1 + alpha_cu * (Ts_max - T_ref));

    % 2. Submatrices A (3x3) para aislar s1, s2 y s3 (ignorando el polo eléctrico del eje d)
    A_min = [ -Rs_nom/Lq, -(P_p*lambda_m)/Lq, 0;
              (3/2)*(P_p*lambda_m)/J_eq_min, -b_eq_min/J_eq_min, 0;
              0, 1, 0 ];
              
    A_max = [ -Rs_max/Lq, -(P_p*lambda_m)/Lq, 0;
              (3/2)*(P_p*lambda_m)/J_eq_max, -b_eq_max/J_eq_max, 0;
              0, 1, 0 ];

    % 3. Calcular polos
    polos_min = eig(A_min);
    polos_max = eig(A_max);

    % 4. Identificar s1, s2 y s3
    % (El integrador s1 siempre será 0 o extremadamente cercano a 0)
    
    % Mínimos
    s1_min = 0; 
    p_comp_min = polos_min(abs(polos_min) > 1e-6); % Filtramos el cero
    if imag(p_comp_min(1)) < 0
        p_comp_min = flip(p_comp_min); % Ordenamos para que el +i quede arriba
    end
    
    % Máximos
    s1_max = 0;
    p_comp_max = polos_max(abs(polos_max) > 1e-6); 
    if ~isreal(p_comp_max) && imag(p_comp_max(1)) < 0
        p_comp_max = flip(p_comp_max);
    end

    % 5. Imprimir resultados formateados en consola
    fprintf('\n====================================================================\n');
    fprintf('           POLOS DEL SISTEMA (s1, s2, s3) - CASOS EXTREMOS\n');
    fprintf('====================================================================\n');
    
    fprintf('--- CONDICIONES MÍNIMAS (Nominales) ---\n');
    fprintf('Temp = %.1f °C | Rs = %.4f ohms | Jeq = %.2e | beq = %.2e\n', Tamb_nom, Rs_nom, J_eq_min, b_eq_min);
    fprintf('s1 = %.2f\n', s1_min);
    fprintf('s2 = %.2f + %.2fi\n', real(p_comp_min(1)), imag(p_comp_min(1)));
    fprintf('s3 = %.2f - %.2fi\n', real(p_comp_min(2)), abs(imag(p_comp_min(2))));
    
    fprintf('\n--- CONDICIONES MÁXIMAS (Nominales) ---\n');
    fprintf('Temp = %.1f °C | Rs = %.4f ohms | Jeq = %.2e | beq = %.2e\n', Ts_max, Rs_max, J_eq_max, b_eq_max);
    fprintf('s1 = %.2f\n', s1_max);
    if isreal(p_comp_max)
        % Por si el sistema se vuelve sobreamortiguado y pierde la parte imaginaria
        fprintf('s2 = %.2f\n', p_comp_max(1));
        fprintf('s3 = %.2f\n', p_comp_max(2));
    else
        fprintf('s2 = %.2f + %.2fi\n', real(p_comp_max(1)), imag(p_comp_max(1)));
        fprintf('s3 = %.2f - %.2fi\n', real(p_comp_max(2)), abs(imag(p_comp_max(2))));
    end
    fprintf('====================================================================\n\n');
end