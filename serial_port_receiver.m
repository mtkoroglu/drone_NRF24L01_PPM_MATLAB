clear all; clc;

s = serialport('COM5', 57600); flush(s);
n = 4; % kanal sayısı, drone projesi 4 yapmalı
PPMsinyalPeriod = 22; % ms
PPMsinyal = uint16(zeros(n,1));
i = 0; % paket numarası - her paket {'h', kanal(1), kanal(2), ...}
zaman = 0; stopTime = 45; % saniye
ppmPeriod = 22; % ms

figure(1); set(figure(1), 'position', [241  357  945  420]);
hold on;
xlabel('zaman (ms)');
ylabel('ppm sinyali (V)');
axis([0 PPMsinyalPeriod -0.5 5.5]);
grid on; ax = gca; ax.GridLineStyle = '--';
% set(gca,'position', [0.0719    0.1100    0.9027    0.8150]);

tic;
while (true)
    if ( read(s, 1, 'uint8') == 'h') % paket başladı
        i = i + 1;
        zaman = toc;
        for j=1:n
            PPMsinyal(j) = read(s, 1, 'uint16');
        end
        plot_PPM(PPMsinyal, ppmPeriod, zaman, stopTime);
    end
    if (zaman > stopTime)
        break;
    end
end
delete(s); clear s;
%%
% figure(1);
% hold on;
% plot(time, kanal(1,:), 'r-');
% plot(time, kanal(2,:), 'b-');
% % plot(zaman, kanal(3,:), 'g-'); % drone projesi bu satırı aktif hale getirmeli
% % plot(zaman, kanal(4,:), 'k-'); % drone projesi bu satırı aktif hale getirmeli
% legend('kanal 1', 'kanal 2'); % drone projesi legend'a kanal 3 ve 4'ü eklemeli
% set(legend, 'location', 'northwest');
% xlabel('zaman (s)');
% ylabel('kanal sinyali');
% axis([0 time(end) -10 265]);
% grid on; ax = gca; ax.GridLineStyle = '--';
% hold off;
% 
% figure(2);
% subplot(2,1,1);
% plot(time, kanal(1,:), 'r-');
% xlabel('zaman (s)');
% ylabel('kanal 1 sinyali');
% axis([0 time(end) -10 315]);
% grid on; ax = gca; ax.GridLineStyle = '--';
% subplot(2,1,2);
% plot(time, kanal(2,:), 'b-');
% xlabel('zaman (s)');
% ylabel('kanal 2 sinyali');
% axis([0 time(end) -10 315]);
% grid on; ax = gca; ax.GridLineStyle = '--';
% % subplot(2,2,3);
% % plot(time, kanal(3,:), 'g-');
% % xlabel('zaman (s)');
% % ylabel('kanal 3 sinyali');
% % axis([0 time(end) -10 315]);
% % grid on; ax = gca; ax.GridLineStyle = '--';
% % subplot(2,2,4);
% % plot(time, kanal(4,:), 'k-');
% % xlabel('zaman (s)');
% % ylabel('kanal 4 sinyali');
% % axis([0 time(end) -10 315]);
% % grid on; ax = gca; ax.GridLineStyle = '--';