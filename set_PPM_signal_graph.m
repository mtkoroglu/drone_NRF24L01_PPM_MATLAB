function [] = set_PPM_signal_graph(PPMsinyalPeriod)
figure(1); screenSize = get(0,'ScreenSize');
set(figure(1), 'position', [20  250  screenSize(3)*0.97  420]);
hold on; xlabel('zaman (ms)', 'fontsize', 15); ylabel('ppm sinyali (V)', 'fontsize', 15);
axis([0 PPMsinyalPeriod -1 7]);
grid on; ax = gca; ax.GridLineStyle = '--';
set(gca,'position', [0.0387    0.1429    0.9490    0.7829]);
set(gca, 'xtick', [0:1:PPMsinyalPeriod], 'xticklabel', ...
    {'0','','2','','4','','6','','8','','10','','12','','14','','16','','18','','20','','22'}, 'yticklabel', ...
    {'','0','','','','','5','',''}, 'fontsize', 14);
end