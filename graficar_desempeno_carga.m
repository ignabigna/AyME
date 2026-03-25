function graficar_desempeno_carga(Lq, Rs_ref, alpha_cu, T_ref, Tamb_min, Ts_max, P_p, lambda_m, Jm, bm, r, m_brazo, l_cm, J_cm, l_l, m_carga_min, m_carga_max, b_art_nom, b_art_var)
    % 1. Rango de temperaturas y resistencias
    T_vec = linspace(Tamb_min, Ts_max, 100);
    Rs_vec = Rs_ref * (1 + alpha_cu * (T_vec - T_ref));
    
    % 2. Dinámica para Carga Mínima (Nominal)
    Jl_min = (m_brazo * l_cm^2 + J_cm) + m_carga_min * l_l^2;
    Jeq_min = Jm + (Jl_min / r^2);
    beq_min = bm + (b_art_nom / r^2);
    
    % 3. Dinámica para Carga Máxima
    Jl_max = (m_brazo * l_cm^2 + J_cm) + m_carga_max * l_l^2;
    Jeq_max = Jm + (Jl_max / r^2);
    beq_max = bm + ((b_art_nom + b_art_var) / r^2);
    
    % 4. Cálculo de Wn y Zeta para ambos casos
    % Wn = sqrt( (Rs*beq + 1.5 * p^2 * lambda_m^2) / (Jeq * Lq) )
    wn_min = sqrt((Rs_vec .* beq_min + 1.5 * P_p^2 * lambda_m^2) ./ (Jeq_min * Lq));
    wn_max = sqrt((Rs_vec .* beq_max + 1.5 * P_p^2 * lambda_m^2) ./ (Jeq_max * Lq));
    
    % Zeta = (Lq*beq + Rs*Jeq) / (2 * Jeq * Lq * wn)
    zeta_min = (Lq * beq_min + Rs_vec .* Jeq_min) ./ (2 * Jeq_min * Lq .* wn_min);
    zeta_max = (Lq * beq_max + Rs_vec .* Jeq_max) ./ (2 * Jeq_max * Lq .* wn_max);
    
    % 5. Graficar Frecuencia Natural (Wn)
    figure('Name', 'Frecuencia Natural', 'Color', 'w');
    plot(Rs_vec, wn_min, 'b-', 'LineWidth', 2); hold on;
    plot(Rs_vec, wn_max, 'r--', 'LineWidth', 2);
    
    % Marcador en Rs_ref
    wn_ref_min = interp1(Rs_vec, wn_min, Rs_ref);
    plot(Rs_ref, wn_ref_min, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
    
    grid on;
    xlabel('Resistencia del estator $R_s$ [$\Omega$]', 'Interpreter', 'latex', 'FontSize', 12);
    ylabel('Frecuencia natural $\omega_n$ [rad/s]', 'Interpreter', 'latex', 'FontSize', 12);
    title('Frecuencia natural vs. Resistencia del estator', 'FontSize', 13);
    legend('Carga Mínima ($J_{eq\_min}, b_{eq\_min}$)', 'Carga Máxima ($J_{eq\_max}, b_{eq\_max}$)', '$R_{s\_ref}$ nominal', 'Location', 'best', 'Interpreter', 'latex');
    
    % 6. Graficar Relación de Amortiguamiento (Zeta)
    figure('Name', 'Amortiguamiento', 'Color', 'w');
    plot(Rs_vec, zeta_min, 'b-', 'LineWidth', 2); hold on;
    plot(Rs_vec, zeta_max, 'r--', 'LineWidth', 2);
    
    % Marcador en Rs_ref
    zeta_ref_min = interp1(Rs_vec, zeta_min, Rs_ref);
    plot(Rs_ref, zeta_ref_min, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 8);
    
    grid on;
    xlabel('Resistencia del estator $R_s$ [$\Omega$]', 'Interpreter', 'latex', 'FontSize', 12);
    ylabel('Relación de amortiguamiento $\zeta$ [-]', 'Interpreter', 'latex', 'FontSize', 12);
    title('Amortiguamiento relativo vs. Resistencia del estator', 'FontSize', 13);
    legend('Carga Mínima ($J_{eq\_min}, b_{eq\_min}$)', 'Carga Máxima ($J_{eq\_max}, b_{eq\_max}$)', '$R_{s\_ref}$ nominal', 'Location', 'best', 'Interpreter', 'latex');
end