t = sim_cohete.time;
h = sim_cohete.signals(1).values;
v = sim_cohete.signals(2).values;

figure(1)
plot(t,h);
axis([0 37.5 0 1400])
title('Altura del cohete en función del tiempo');
ylabel('Altura (m)');
xlabel('Tiempo (s)');
print('altura_cohete_vs_tiempo','-depsc', '-r300');

figure(2)
plot(t,v);
axis([0 37.5 -100 250])
title('Velocidad del cohete en función del tiempo');
ylabel('Velocidad (m/s)');
xlabel('Tiempo (s)');
print('velocidad_cohete_vs_tiempo','-depsc', '-r300');