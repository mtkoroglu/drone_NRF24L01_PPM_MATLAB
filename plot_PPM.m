function [] = plot_PPM(PPMsinyal, ppmPeriod, zaman, stopTime)
PPMsinyalMS = single(PPMsinyal) / 1000; % us --> ms
cla;
plot([0, 0.4, 0.4], [0, 0, 5], 'k.-', 'linewidth', 2);
plot([0.4, PPMsinyalMS(1), PPMsinyalMS(1)], [5, 5, 0], 'k.-', 'linewidth', 2);
plot([PPMsinyalMS(1), 0.4+PPMsinyalMS(1), 0.4+PPMsinyalMS(1)], [0, 0, 5], 'k.-', 'linewidth', 2);
plot([PPMsinyalMS(1)+0.4, sum_PPM(PPMsinyalMS,2), sum_PPM(PPMsinyalMS,2)], [5, 5, 0], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,2), sum_PPM(PPMsinyalMS,2)+0.4, sum_PPM(PPMsinyalMS,2)+0.4], [0, 0, 5], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,2)+0.4, sum_PPM(PPMsinyalMS,3), sum_PPM(PPMsinyalMS,3)], [5, 5, 0], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,3), sum_PPM(PPMsinyalMS,3)+0.4, sum_PPM(PPMsinyalMS,3)+0.4], [0, 0, 5], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,3)+0.4, sum_PPM(PPMsinyalMS,4), sum_PPM(PPMsinyalMS,4)], [5, 5, 0], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4), sum_PPM(PPMsinyalMS,4)+0.4, sum_PPM(PPMsinyalMS,4)+0.4], [0, 0, 5], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4)+0.4, sum_PPM(PPMsinyalMS,4)+1.5, sum_PPM(PPMsinyalMS,4)+1.5], [5, 5, 0], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4)+1.5, sum_PPM(PPMsinyalMS,4)+1.5+0.4, sum_PPM(PPMsinyalMS,4)+1.5+0.4], [0, 0, 5], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4)+1.5+0.4, sum_PPM(PPMsinyalMS,4)+2*1.5, sum_PPM(PPMsinyalMS,4)+2*1.5], [5, 5, 0], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4)+2*1.5, sum_PPM(PPMsinyalMS,4)+2*1.5+0.4, sum_PPM(PPMsinyalMS,4)+2*1.5+0.4], [0, 0, 5], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4)+2*1.5+0.4, sum_PPM(PPMsinyalMS,4)+3*1.5, sum_PPM(PPMsinyalMS,4)+3*1.5], [5, 5, 0], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4)+3*1.5, sum_PPM(PPMsinyalMS,4)+3*1.5+0.4, sum_PPM(PPMsinyalMS,4)+3*1.5+0.4], [0, 0, 5], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4)+3*1.5+0.4, sum_PPM(PPMsinyalMS,4)+4*1.5, sum_PPM(PPMsinyalMS,4)+4*1.5], [5, 5, 0], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4)+4*1.5, sum_PPM(PPMsinyalMS,4)+4*1.5+0.4, sum_PPM(PPMsinyalMS,4)+4*1.5+0.4], [0, 0, 5], 'k.-', 'linewidth', 2);
plot([sum_PPM(PPMsinyalMS,4)+4*1.5+0.4, ppmPeriod, ppmPeriod], [5, 5, 0], 'k.-', 'linewidth', 2);
title(sprintf('PPM1 = %i  PPM2 = %i  PPM3 = %i  PPM4 = %i  zaman = %.2f / %.2f\n', ...
    PPMsinyal(1), PPMsinyal(2), PPMsinyal(3), PPMsinyal(4), zaman, stopTime));
end