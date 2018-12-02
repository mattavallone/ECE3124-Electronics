%% Electronics II Project II test calculations
% Matthew Avallone
clc;
clear;
% Chosen Outright
Vcc = 28; % Voltage Source in volts
b = 200; % Beta
R1 = 56000; % Resistor 1 in ohms
R2 = 14000; % Resistor 2 in ohms

% Calculations

% Target Values
% Rin = 10000; % Input Resistance of amplifier in ohms
% Ai = 4.1879; % Current Gain of Driver
% I_L,pk = 0.0021; % Peak current swing through Rin of power stage

Rth = (R1*R2)/(R1+R2); % Thevenin resistance of R1 and R2 in BE-loop in ohms
syms Re Rc % Defining two resistance variables to calculate
ICQ = 0.0021*(Rc+2258)/ Rc; % Using equation for peak current swing through load
rpi = b*0.026*Rc / (0.0021*(Rc+2258)); % R_pi in ohms
eqns = [b*Rc*Rth /((Rth+rpi+(1+b)*Re)*(Rc+2258)) == 4.1879, ...
    b*0.026*Rc/((0.0021)*(Rc+2258)) == (Rth*(1+b)*Re - (1+b)*10000*Re - ...
    Rth*10000) / (10000 - Rth)]; % Solving two equations for Re and Rc
R = solve(eqns,[Re,Rc]); % Resistor solutions
Re = double(R.Re) % Emitter Resistor in ohms
Rc = double(R.Rc) % Collector Resistor in ohms
ICQ = 0.0021*(Rc+2258)/Rc % Collector current in Amps
rpi = b*0.026*Rc / (0.0021*(Rc+2258)); % R_pi in ohms
VCEQ = Vcc - ICQ*Rc - ICQ*Re % Collector-Emitter Voltage in volts
Rin = Rth * (rpi+(1+b)*Re) / (Rth + rpi + (1+b)*Re) % Checking input resistance equals target
Ai = b*Rc*Rth / ((Rth+rpi+(1+b)*Re)*(Rc+2258)) % Checking current gain equals target
Vs = ((ICQ*Rth/b + (b+1)/b*ICQ*Re)) / (R2/(R1+R2)) % Checked Voltage from power source around BE-loop
Pd = ICQ*VCEQ % Checking transistor power dissipation is below 0.6 Watts


