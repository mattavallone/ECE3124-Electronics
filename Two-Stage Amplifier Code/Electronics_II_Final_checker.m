%% Electronics II Final Project Calculations Verifier
% Matthew Avallone

clc;clear;

Vcc = 35; % volts
Rs = 10000; %all in ohms
R1 = 100000; 
R2 = 50000;
Rc = 520;
RL = 258;

beta = 125 %varies from 75 to 200

%DC Parameters
syms Icq % Finding Icq with respect to changing beta
eqn = Vcc*R2/(R1+R2) == Icq/beta*R1*R2/(R1+R2) + 0.7; %BE-loop eqn
Ic = double(solve(eqn,Icq)) %ohms
syms vce
eqn = vce == Vcc-Ic*Rc;
Vce = double(solve(eqn,vce)) %V
PD = Ic*Vce %Transistor power in Watts

%AC parameters
ro = 74/Ic; %ohms
rpi = beta*0.026/Ic; %ohms

%Finding Rf with respect to changing beta
syms rf 
Rac = Rc*RL / (Rc+RL); %intermediate variable name, ohms
RacRo = ro*Rac / (ro+Rac); %intermediate variable name, ohms
Rout = rf*RacRo / (rf+RacRo); %ohms
eqn = 3500 == beta*rf*Rout /(rf+beta*Rout);
Rf = double(solve(eqn,rf)); %ohms

%Checking the Gain (had to redefine same resistances)
Rac = Rc*RL / (Rc+RL); 
RacRo = ro*Rac / (ro+Rac);
Rth = R1*R2/(R1+R2);
RsRth = Rs*Rth/(Rs+Rth);
Ri = RsRth*Rf/(RsRth+Rf);
Rout = Rf*RacRo / (Rf+RacRo);
Af = beta*Ri*Rf*Rout /(Rf*(Ri+rpi)+beta*Ri*Rout) %closed-loop gain