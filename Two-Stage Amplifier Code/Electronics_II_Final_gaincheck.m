clear;clc;
Vcc = 35;
Rc = 520;
beta = 125;
Rf = 4350;
R1 = 100000;
R2 = 50000;
RL = 258;
Rs = 10000;

syms vce
syms Icq
eqn = Vcc*50000/(R1+R2) == (Icq/beta)*R1*R2/(R1+R2) + 0.7; %BE-loop eqn
Ic = double(solve(eqn,Icq)) %A
eqn = vce == Vcc-Ic*Rc;
Vce = double(solve(eqn,vce)) %V
ro = 74/Ic; %ohms
rpi = 0.026/Ic*beta; %ohms

Rac = Rc*RL / (Rc+RL); %AC resistors, ohms
Rrr = ro*Rac / (ro+Rac); %made up intermediate variable name, ohms
Rth = R1*R2/(R1+R2); %ohms
Rrrr = Rf*Rrr / (Rf+Rrr); %ohms
Af = beta*Rf*Rrrr /(Rf+beta*Rrrr)

PD = Ic*Vce

