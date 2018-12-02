%% Electronics II Project I test calculations
% Matthew Avallone
clc;
clear;
% Chosen Outright
Vcc = 20; % Voltage Source in volts
Icq = 0.1157; % Collect current at Q point in amps
b = 300; % Beta
R1 = 3000; % Resistor 1 in ohms
R2 = 20000; % Resistor 2 in ohms

% Calculated
rpi = b*0.026/Icq; % R_pi in ohms
Rth = (R1*R2)/(R1+R2); % Thevenin resistance in ohms
Vth = Vcc*(R2/(R1+R2)); % Thevenin voltage in volts
Ieq = (b+1)/b*Icq; % Emitter current at Q point in amps
Ib = Icq/b; % Base current at Q point in amps
Re = (Vth-Ib*Rth-0.8)/Ieq % Emitter resistor in ohms, found from BE-loop
Rac = (Re*64)/(Re+64); % AC resistance value in ohms
Ai = ((b+1)*Re*Rth)/((Re+64)*(Rth+rpi+(1+b)*Rac)) % Current Gain
ICQ = Vcc / (Re+Rac) % Checked collector current with calculated resistances
VCEQ = Vcc-ICQ*Re % Collector-Emitter Voltage at Q point

% Load Lines
Ic = @(V) -V/((b+1)/b*Re)+Vcc/((b+1)/b*Re); % DC line
ic = @(v) -v/Rac+2*ICQ; % AC line
vce = 0:0.2:Vcc; % range on Vce
plot(vce,Ic(vce),vce,ic(vce))
legend('DC','AC')
ylim([0 2*ICQ])
xlabel('Vce')
ylabel('Ic')
title('AC/DC Load Lines')