%% Electronics Final Project
% Matthew Avallone

clc;clear;
Rs = 10000; %given
Icq = 0.02; %A, maxed out at 18mA for beta = 75
Vceq = 10; %V
Vcc = 35; %V
RL = 278; %ohms
beta = 75;
Rc = (Vcc-Vceq)/Icq; %ohms
%IC = Vcc / (Rc*RL/(Rc+RL)); %A

ro = 74/Icq; %ohms
rpi = beta*0.026/Icq %ohms

%To force R* >> rpi, find large Rth from R1 and R2
R1 = 100000; %ohms
syms r2
eqn = Vcc*r2/(R1+r2) == Icq/beta*R1*r2/(R1+r2) + 0.7; %BE-loop eqn
R2 = double(solve(eqn,r2)) %ohms

% With Rpi = 200, Rs||Rf||R1||R2 >> Rpi or Rs||Rf||R1||R2 = 2k

%if Rs||Rf||R1||R2 >> rpi
syms rf
Rac = Rc*RL / (Rc+RL); %AC resistors, ohms
Rrr = ro*Rac / (ro+Rac); %made up intermediate variable name, ohms
eqn = 3500 == -beta*rf*rf*Rrr / (rf+Rrr) / (rf-beta*rf*Rrr / (rf+Rrr));
%Forcing Rf to satisfy feedback gain condition
Rf = double(solve(eqn,rf)) %ohms

% Since Rf >= 3k, Rs||Rf||R1||R2 >> rpi will be satisfied, so assumption is
% valid

Rr = Rac*ro/(Rac+ro);
Af = -beta*Rf*Rr/(Rf+Rr)*Rf / (Rf-beta*Rf*Rr/(Rf+Rr))