function graficar_polos_temperatura(Ld, Lq, Rs_ref, alpha_cu, T_ref, P_p, lambda_m, J_eq, b_eq, Tamb_min, Ts_max)
    % Rango de temperatura
    T = linspace(Tamb_min, Ts_max, 6);
    
    % Figura
    figure; hold on; grid on;
    for k = 1:length(T)
        
        % Resistencia dependiente de la temperatura
        Rs = Rs_ref*(1 + alpha_cu*(T(k) - T_ref));
        
        % Matriz A
        A = [ -Rs/Ld      0                  0                 0;
               0       -Rs/Lq     -(P_p*lambda_m)/Lq            0;
               0   (3/2)*(P_p*lambda_m)/J_eq   -b_eq/J_eq          0;
               0           0                 1                 0 ];
        
        % Sistema (sin ceros relevantes)
        B = [0; 1/Lq; 0; 0];
        C = eye(4);
        D = zeros(4,1);
        
        sys = ss(A,B,C,D);
        
        % Polos
        polos = eig(A);
        
        % Graficar
        plot(real(polos), imag(polos), 'x', 'DisplayName', ...
            sprintf('R_s = %.3f \\Omega (T = %.1f °C)', Rs, T(k)));
    end
    sgrid;
    xlabel('Parte real');
    ylabel('Parte imaginaria');
    title('Mapa de polos para distintos valores de temperatura');
    legend show;
    legend('Location','best');

end