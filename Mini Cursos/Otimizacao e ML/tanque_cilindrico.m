function [Material,grad] = tanque_cilindrico(X)
    
    % Declarar variáveis com vetor de inputs
    raio = X(1);
    altura = X(2);
    
    V = pi*raio^2*altura; % Volume
    Material = 2*pi*raio*altura; % Material utilizado
    
    if V < 650 || Material<0% Caso V seja menor que 650
        Material = inf;
    end


    
    if nargout > 1 % No caso do gradiente
        
        g = [2*pi*altura;
        2*pi*raio];

    end

end

