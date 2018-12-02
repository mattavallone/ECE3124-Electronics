Ic = 0.001; % in A
Vce = 0.5; % in V
Vt = 0.026; % in V
beta = 100;
Ib = Ic/beta; % in A
Va = 100; % in V
Vcc = 10; % in V
Ro = Va / Ic;
Rpi = beta*Vt / Ic;
gm = Ic / Vt;
RL = 2000; % in Ohms
Vbe = 0.7; % in V
Rth = @(R1,R2) R1*R2/(R1+R2); % thevenin resistance R1 and R2
Vth1 = @(R1,R2) Vcc.*(R2./(R1+R2)); % Thevenin Voltage
Vth2 = @(R1,R2) Ib.*Rth(R1,R2)+Vbe;
Rc = (Vcc - Vce) / Ic;
Rout = (((Ro*Rc/(Ro+Rc))*RL)/((Ro*Rc/(Ro+Rc))+RL));


Rin = @(R1,R2)(Rth(R1,R2)*Rpi)./(Rth(R1,R2)+Rpi);
Vo = gm*Rout;
Vi = @(R1,R2)(Rin(R1,R2) + 50) ./ Rin(R1,R2);
Av = @(R1,R2) Vo/Vi(R1,R2);

i = 1;
for r1 = 0:10:1e5
    for r2 = 0:10:1e5
        if Av(r1,r2) > 56 && Av(r1,r2) < 60
            res(i) = struct('R1',r1,'R2',r2); 
            i = i+1;
        end
    end
end
