%t = (0:0.01:1000)';

D = 33;
J = 17.3175;
B = 0.0001;
mc = 30;
s = 0.3;
b = 0.75;
r = 0.1;

t = magnitud_velocidad_traslacional.Time;
v = magnitud_velocidad_traslacional.Data;
w = omega_centro_contra_desplazamiento.Data;
wdot = zeros(length(w),1);
vdot = zeros(length(v),1);

for i=2:length(v)
    vdot(i) = (v(i)-v(i-1))/(t(i)-t(i-1));
    wdot(i) = (w(i)-w(i-1))/(t(i)-t(i-1));
end
vdot(1) = vdot(2);
wdot(1) = wdot(2);


Fm = D*vdot + ((2*B)/(r^2))*v - mc*s*w.^2;
Tm = J*wdot + ((2*B*(b^2))/(r^2))*w + mc*s*w.*v;

tau_r = (r/2)*(Fm + (1/b)*Tm);
tau_l = (r/2)*(Fm - (1/b)*Tm);



tau_r = zeros(length(t),1);

for k=0:10
    tau_r = heaviside(t); %tau_r + 0.1*(t-5*(2*k)).*(heaviside(t-5*(2*k))-heaviside(t-5*(2*k+1)));
end

tau_l = zeros(length(t),1);

for k=0:299
    tau_l = 0*t;  
     %0.1*heaviside(t); %20*cos(t); %tau_l - 0.01*(t-5*(2*k)).*(heaviside(t-5*(2*k))-heaviside(t-5*(2*k+1)));
end

figure
plot(t,v,t,w);
figure
plot(t,tau_r,t,tau_l);