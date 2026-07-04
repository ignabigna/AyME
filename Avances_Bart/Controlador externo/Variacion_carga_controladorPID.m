function Variacion_carga_controladorPID2(K_p, K_i, K_d, b_eq_max, m, l_cm, J_cm, l_l, J_m, r)
    % =====================================================================
    % FUNCIÓN: Evalúa e imprime la migración de polos y variación de zeta
    % ante cambios de carga (m_l) usando un controlador PID fijo.
    % =====================================================================
    K_d_test = b_eq_max;
    % 1. Definir el vector de masas a evaluar
    m_l_array = [0, 0.25, 0.50, 0.75, 1.0, 1.25, 1.5];
    num_cases = length(m_l_array);

    % 2. Encabezado de la tabla en consola (agregada columna para Zeta)
    fprintf('\n------------------------------------------------------------------------------------------------------\n');
    fprintf(' Carga (m_l)  |  Inercia (J_eq)  | Amortig. (zeta) |   Polo 1 (Real)   |   Polos 2 y 3 (Conjugados)   \n');
    fprintf('------------------------------------------------------------------------------------------------------\n');

    % 3. Configurar la figura para el gráfico
    figure('Name', 'Migración de Polos', 'NumberTitle', 'off');
    hold on; grid on;
    title('Migración de Polos (PID Nominal vs. Variación de Masa de Carga)');
    xlabel('Eje Real (\sigma)');
    ylabel('Eje Imaginario (j\omega)');
    
    colores = lines(num_cases); 

    % 4. Bucle para analizar cada masa
    for k = 1:num_cases
        m_l = m_l_array(k);
        
        % A) Cálculo de inercias para la masa actual
        J_l = (m * (l_cm^2) + J_cm) + m_l * (l_l^2);
        J_eq = J_m + (J_l / (r^2)); 
        
        % B) Armar el polinomio característico de Lazo Cerrado
        coeficientes = [J_eq, (b_eq_max + K_d), K_p, K_i];
        
        % C) Calcular los polos exactos
        polos = roots(coeficientes);
        
        % Ordenamos los polos (el real puro primero)
        [~, idx] = sort(abs(imag(polos)));
        polos_ordenados = polos(idx);
        
        p1 = polos_ordenados(1); % Polo real puro
        p2 = polos_ordenados(2); % Polo complejo conjugado 1
        
        % D) Cálculo analítico de Zeta (zitta) para el par conjugado actual
        sigma_actual = abs(real(p2));
        omega_d_actual = abs(imag(p2));
        zeta_actual = sigma_actual / sqrt(sigma_actual^2 + omega_d_actual^2);
        
        % E) Imprimir los valores en la consola bien tabulados
        fprintf('  %4.2f kg    |   %e   |     %5.3f       |    %7.2f      |    %7.2f +/- %7.2fi\n', ...
            m_l, J_eq, zeta_actual, real(p1), real(p2), abs(imag(p2)));
        
        % F) Graficar los polos de este caso específico
        plot(real(polos), imag(polos), 'o', ...
            'MarkerSize', 10, 'LineWidth', 2, 'Color', colores(k,:), ...
            'DisplayName', sprintf('m_l = %.2f kg', m_l));
    end

    % 5. Detalles finales del gráfico
    fprintf('------------------------------------------------------------------------------------------------------\n\n');
    xline(0, 'k-', 'LineWidth', 1.5, 'HandleVisibility', 'off'); 
    yline(0, 'k-', 'LineWidth', 1.5, 'HandleVisibility', 'off');
    legend('Location', 'best');
    hold off;
end