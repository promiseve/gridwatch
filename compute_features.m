% Ir, Ii etc. are (num_scenarios) x (num_sensors)
% Output X is (num_features) x (num_scenarios) x (num_sensors)

function X = compute_features(M, Ir, Ii, Vr, Vi)

num_features = 2;
X = nan(num_features, size(Ir, 1), size(Ir, 2));


I = Ir + 1i * Ii;
V = Vr + 1i * Vi;

for scenario_idx = 1:size(I, 1)
    Vcur = V(scenario_idx, :);
    Icur = I(scenario_idx, :);
    
%     powerdiff = (Vcur(M.branch(:, 1)) - Vcur(M.branch(:, 2))) .* conj(Icur);
%     X(1, scenario_idx, :) = real(powerdiff);
%     X(2, scenario_idx, :) = imag(powerdiff);
    power = (Vcur(M.branch(:, 1)) + Vcur(M.branch(:, 2))) .* (conj(Icur));
    X(1, scenario_idx, :) = real(power);
    X(2, scenario_idx, :) = imag(power);
    
%     X(3, scenario_idx, :) = abs(Icur);
%     X(4, scenario_idx, :) = imag(Vcur(M.branch(:, 1)));
%     powersum = (Vcur(M.branch(:, 2))) .* conj(Icur);
%     X(3, scenario_idx, :) = real(powersum);
%     X(4, scenario_idx, :) = imag(powersum);
end
end