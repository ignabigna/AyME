function graficar_polos_temperatura2(Ld, Lq, Rs_ref, alpha_cu, T_ref, P_p, lambda_m, J_eq, b_eq, Tamb_min, Ts_max)
    % Rango de temperatura
    T = linspace(Tamb_min, Ts_max, 6);
    
    % Preparar variables para guardar los datos de la tabla
    tabla_T = zeros(length(T), 1);
    tabla_Rs = zeros(length(T), 1);
    tabla_p_cero = zeros(length(T), 1);
    tabla_p_comp1 = zeros(length(T), 1);
    tabla_p_comp2 = zeros(length(T), 1);
    tabla_p_d = zeros(length(T), 1); % Polo del eje d
    
    % Figura
    figure('Color', 'w'); hold on; grid on;
    for k = 1:length(T)
        
        % Resistencia dependiente de la temperatura
        Rs = Rs_ref*(1 + alpha_cu*(T(k) - T_ref));
        
        % Matriz A
        A = [ -Rs/Ld      0                  0                 0;
               0       -Rs/Lq     -(P_p*lambda_m)/Lq             0;
               0   (3/2)*(P_p*lambda_m)/J_eq   -b_eq/J_eq          0;
               0           0                  1                 0 ];
        
        % Polos
        polos = eig(A);
        
        % -- Lógica para ordenar los polos para la tabla --
        % 1. Polo en el origen (integrador)
        p_cero = polos(abs(polos) < 1e-6);
        if isempty(p_cero), p_cero = 0; end
        
        % 2. Polo real del eje d (-Rs/Ld)
        p_real = polos(abs(imag(polos)) < 1e-6 & abs(polos) > 1e-6);
        if isempty(p_real), p_real = NaN; end
        
        % 3. Polos complejos conjugados
        p_comp = polos(abs(imag(polos)) > 1e-6);
        if length(p_comp) == 2
            if imag(p_comp(1)) < 0
                p_comp = [p_comp(2); p_comp(1)]; % Forzar que el positivo esté primero
            end
        else
            p_comp = [NaN; NaN];
        end
        
        % Guardar en arrays para imprimir después
        tabla_T(k) = T(k);
        tabla_Rs(k) = Rs;
        tabla_p_cero(k) = p_cero(1);
        tabla_p_comp1(k) = p_comp(1);
        tabla_p_comp2(k) = p_comp(2);
        tabla_p_d(k) = p_real(1);
        
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
    
    % ==========================================
    % IMPRESIÓN DE LA TABLA EN CONSOLA Y LATEX
    % ==========================================
    
    % 1. Salida visual en consola
    fprintf('\n--- TABLA DE POLOS EN CONSOLA ---\n');
    fprintf('Ts [°C] | Rs [ohm] | Polo 1 (Int) | Polo 2 (Comp)         | Polo 3 (Comp)         | Polo d (Real)\n');
    fprintf('-----------------------------------------------------------------------------------------------------\n');
    for k = 1:length(T)
        fprintf('%7.2f | %8.4f | %12.2f | %7.2f + %6.2fi | %7.2f - %6.2fi | %10.2f\n', ...
            tabla_T(k), tabla_Rs(k), tabla_p_cero(k), ...
            real(tabla_p_comp1(k)), imag(tabla_p_comp1(k)), ...
            real(tabla_p_comp2(k)), abs(imag(tabla_p_comp2(k))), ...
            tabla_p_d(k));
    end
    
    % 2. Salida en formato LaTeX lista para copiar y pegar
    fprintf('\n--- CÓDIGO LATEX PARA TU INFORME ---\n');
    fprintf('\\begin{table}[htbp]\n\\centering\n');
    fprintf('\\caption{Evolución de los polos del sistema a lazo abierto con la temperatura $T_s$}\n');
    fprintf('\\label{tab:polos_temp}\n');
    fprintf('\\begin{tabular}{cccccc}\n\\toprule\n');
    % Agregué el polo del eje d al final para que tu tabla sea más completa que la de la imagen
    fprintf('$T_s$ [$^\\circ$C] & $R_s$ [$\\Omega$] & Polo 1 [rad/s] & Polo 2 [rad/s] & Polo 3 [rad/s] & Polo $d$ [rad/s] \\\\\n\\midrule\n');
    for k = 1:length(T)
        % Reemplazamos los puntos por comas en LaTeX si lo prefieres para formato en español
        fprintf('%.2f & %.4f & %.2f & $%.2f + %.2f\\text{i}$ & $%.2f - %.2f\\text{i}$ & %.2f \\\\\n', ...
            tabla_T(k), tabla_Rs(k), tabla_p_cero(k), ...
            real(tabla_p_comp1(k)), imag(tabla_p_comp1(k)), ...
            real(tabla_p_comp2(k)), abs(imag(tabla_p_comp2(k))), ...
            tabla_p_d(k));
    end
    fprintf('\\bottomrule\n\\end{tabular}\n\\end{table}\n\n');

end