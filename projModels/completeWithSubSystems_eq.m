%% constants
Tr  = 25 + 273.15;            % Reference Temperature in Kelvins
k   = 1.3805*10^(-23);        % Boltzman's Constant in J/K
q   = 1.6022*10^(-19);        % Elecronic Charge in Coulombs
Eg  = 1.1;                    % Band gap energy of Silicon at ambient temperature of 25 C
Rsh = 1000;                   % Intrincic Shunt Resistance in Ohms
Ns  = 1;                      % Number of cells in series
n   = 1.2;                    % Number Silicon diode Ideality factor
Isc = 6.4;                    % Rated SPV cell Short Circuit Current in Amps
Voc = .611;                   % Rated SPV cell Open Circuit Voltage in Volts
Iro = 1000;                   % 
Rs  = .0001;                  % Intrincic Series Resistance in Ohms
Np  = 1;                      % Number of cells in parallel 

Ki = .002;
%% user inputs
Vo = 17.5;
T = 30 + 273.15;
Ir = 1000;

%%equations
Iph = (Isc + Ki * (T - Tr)) * Ir / 1000;            % 6.5 / 1

Vt = k * T / q;                                     % 6.9 / 5

Irs = Isc / (exp(Voc / (n * Ns * Vt)) - 1);        % 6.6 / 2


Io = Irs * (T / Tr) ^ 3 * ...
     exp((q * Eg / (n * k)) * ((1 / T) - (1 / Tr)));% 6.7 / 3

Ish = (Vo * Np / Ns + Io * Rs) / Rsh;               % 6.10/ 6


Id = Np * Io * (exp((Vo / Ns + Io * Rs / Np) / (n * Vt)) - 1);


I = Np * Iph - Id - Ish;                            %6.8 / 4

VI = [Vo, I];
plot(Vo, I);

