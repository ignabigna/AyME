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
    
    % 4. Cálculo de Wn y Zeta
    wn_min = sqrt((Rs_vec .* beq_min + 1.5 * P_p^2 * lambda_m^2) ./ (Jeq_min * Lq));
    wn_max = sqrt((Rs_vec .* beq_max + 1.5 * P_p^2 * lambda_m^2) ./ (Jeq_max * Lq));
    
    zeta_min = (Lq * beq_min + Rs_vec .* Jeq_min) ./ (2 * Jeq_min * Lq .* wn_min);
    zeta_max = (Lq * beq_max + Rs_vec .* Jeq_max) ./ (2 * Jeq_max * Lq .* wn_max);
    
    % Selección de puntos discretos (sobre la curva)
    n_pts = 6;
    idx = round(linspace(1, length(Rs_vec), n_pts));

    %% ===== GRÁFICA Wn =====
    figure('Name', 'Frecuencia Natural', 'Color', 'w');

    % Curvas continuas
    plot(Rs_vec, wn_min, 'b-', 'LineWidth', 2); hold on;
    plot(Rs_vec, wn_max, 'k-', 'LineWidth', 2);

    % Puntos discretos encima
    plot(Rs_vec(idx), wn_min(idx), 'o', ...
        'Color', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', 6);

    plot(Rs_vec(idx), wn_max(idx), 's', ...
        'Color', 'k', 'MarkerFaceColor', 'k', 'MarkerSize', 6);

    grid on;
    xlabel('R_s [\Omega]', 'FontSize', 12);
    ylabel('\omega_n [rad/s]', 'FontSize', 12);
    title('Frecuencia natural vs Resistencia del estator', 'FontSize', 13);

    legend('Carga mínima', 'Carga máxima', ...
           'Puntos mínima', 'Puntos máxima', ...
           'Location', 'best');

    %% ===== GRÁFICA Zeta =====
    figure('Name', 'Amortiguamiento', 'Color', 'w');

    % Curvas continuas
    plot(Rs_vec, zeta_min, 'b-', 'LineWidth', 2); hold on;
    plot(Rs_vec, zeta_max, 'k-', 'LineWidth', 2);

    % Puntos discretos encima
    plot(Rs_vec(idx), zeta_min(idx), 'o', ...
        'Color', 'b', 'MarkerFaceColor', 'b', 'MarkerSize', 6);

    plot(Rs_vec(idx), zeta_max(idx), 's', ...
        'Color', 'k', 'MarkerFaceColor', 'k', 'MarkerSize', 6);

    grid on;
    xlabel('R_s [\Omega]', 'FontSize', 12);
    ylabel('\zeta', 'FontSize', 12);
    title('Amortiguamiento vs Resistencia del estator', 'FontSize', 13);

    legend('Carga mínima', 'Carga máxima', ...
           'Puntos mínima', 'Puntos máxima', ...
           'Location', 'best');

end