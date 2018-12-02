%% Matthew Avallone
% Electronics I HW #1

%% 1

%a
Is1 = 1e-13;
V = -5:0.05:1;
iD1 = @(Vd) Is1.*(exp(Vd/0.026)-1);
Is2 = 1e-14;
iD2 = @(Vd) Is2.*(exp(Vd/0.026)-1);
figure(1)
subplot(1,2,1)
plot(V, iD1(V), V, iD2(V));
ylabel('current (A)')
xlabel('voltage (V)')
title('I-V Characteristics')
legend('Is = 1e-13','Is = 1e-14')
axis([-5,1,0,0.2])

%b
Is1 = 1e-13;
V = 0.3:0.001:0.9;
iD1 = @(Vd) Is1.*(exp(Vd/0.026)-1);
Is2 = 1e-14;
iD2 = @(Vd) Is2.*(exp(Vd/0.026)-1);
subplot(1,2,2)
plot(V, iD1(V), V, iD2(V));
ylabel('current (A)')
xlabel('voltage (V)')
title('I-V Characteristics')
legend('Is = 1e-13','Is = 1e-14')
axis([0.3,0.9,0,0.2])

%% 2

Is = 1e-13;
V = 0.3:0.001:0.8;
n1 = 1;
iD1 = @(Vd) Is.*(exp(Vd/(n1*0.026))-1);
n2 = 1.03;
iD2 = @(Vd) Is.*(exp(Vd/(n2*0.026))-1);
figure(2)
plot(V, iD1(V), V, iD2(V));
ylabel('current (A)')
xlabel('voltage (V)')
title('I-V Characteristics')
legend('n = 1','n = 1.03')
axis([0.3,0.8,0,0.2])

