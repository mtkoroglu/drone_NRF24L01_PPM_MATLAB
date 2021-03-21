function [] = plot_PPM(PPMsinyal, ppmPeriod, zaman, stopTime)
PPMsinyalMS = single(PPMsinyal) / 1000; % us --> ms
cla; delete(findall(gcf,'type','annotation')); lw = 1.7;
plot([0, 0.4, 0.4], [0, 0, 5], 'k.-', 'linewidth', lw);
plot([0.4, PPMsinyalMS(1), PPMsinyalMS(1)], [5, 5, 0], 'k.-', 'linewidth', lw);
plot([PPMsinyalMS(1), 0.4+PPMsinyalMS(1), 0.4+PPMsinyalMS(1)], [0, 0, 5], 'k.-', 'linewidth', lw);
plot([PPMsinyalMS(1)+0.4, sum_PPM(PPMsinyalMS,2), sum_PPM(PPMsinyalMS,2)], [5, 5, 0], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,2), sum_PPM(PPMsinyalMS,2)+0.4, sum_PPM(PPMsinyalMS,2)+0.4], [0, 0, 5], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,2)+0.4, sum_PPM(PPMsinyalMS,3), sum_PPM(PPMsinyalMS,3)], [5, 5, 0], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,3), sum_PPM(PPMsinyalMS,3)+0.4, sum_PPM(PPMsinyalMS,3)+0.4], [0, 0, 5], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,3)+0.4, sum_PPM(PPMsinyalMS,4), sum_PPM(PPMsinyalMS,4)], [5, 5, 0], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4), sum_PPM(PPMsinyalMS,4)+0.4, sum_PPM(PPMsinyalMS,4)+0.4], [0, 0, 5], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4)+0.4, sum_PPM(PPMsinyalMS,4)+1.5, sum_PPM(PPMsinyalMS,4)+1.5], [5, 5, 0], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4)+1.5, sum_PPM(PPMsinyalMS,4)+1.5+0.4, sum_PPM(PPMsinyalMS,4)+1.5+0.4], [0, 0, 5], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4)+1.5+0.4, sum_PPM(PPMsinyalMS,4)+2*1.5, sum_PPM(PPMsinyalMS,4)+2*1.5], [5, 5, 0], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4)+2*1.5, sum_PPM(PPMsinyalMS,4)+2*1.5+0.4, sum_PPM(PPMsinyalMS,4)+2*1.5+0.4], [0, 0, 5], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4)+2*1.5+0.4, sum_PPM(PPMsinyalMS,4)+3*1.5, sum_PPM(PPMsinyalMS,4)+3*1.5], [5, 5, 0], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4)+3*1.5, sum_PPM(PPMsinyalMS,4)+3*1.5+0.4, sum_PPM(PPMsinyalMS,4)+3*1.5+0.4], [0, 0, 5], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4)+3*1.5+0.4, sum_PPM(PPMsinyalMS,4)+4*1.5, sum_PPM(PPMsinyalMS,4)+4*1.5], [5, 5, 0], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4)+4*1.5, sum_PPM(PPMsinyalMS,4)+4*1.5+0.4, sum_PPM(PPMsinyalMS,4)+4*1.5+0.4], [0, 0, 5], 'k.-', 'linewidth', lw);
plot([sum_PPM(PPMsinyalMS,4)+4*1.5+0.4, ppmPeriod, ppmPeriod], [5, 5, 0], 'k.-', 'linewidth', lw);
title(sprintf('PPM1 = %i  PPM2 = %i  PPM3 = %i  PPM4 = %i  zaman = %.2f / %.2f\n', ...
    PPMsinyal(1), PPMsinyal(2), PPMsinyal(3), PPMsinyal(4), zaman, stopTime));
set(get(gca,'title'),'Position',[10.8008 6.4326 0]);
if (zaman < (stopTime / 4))
    ha1 = annotation('doublearrow'); ha1.Parent = gca; ha1.X = [0 PPMsinyalMS(1)]; ha1.Y = [6 6];
    text(double(PPMsinyalMS(1)-1.1), 5.5, sprintf('PPM1=%i',PPMsinyal(1)));
else if (zaman >= (stopTime / 4) && zaman < (stopTime / 2))
        ha2 = annotation('doublearrow'); ha2.Parent = gca; ha2.X = [PPMsinyalMS(1) sum_PPM(PPMsinyalMS,2)]; ha2.Y = [6 6];
        text(double(sum_PPM(PPMsinyalMS,2))-1.1, 6.5, sprintf('PPM2=%i',PPMsinyal(2)));
    else if (zaman >= (stopTime / 2) && zaman < 0.75*stopTime)
            ha3 = annotation('doublearrow'); ha3.Parent = gca; ha3.X = [sum_PPM(PPMsinyalMS,2) sum_PPM(PPMsinyalMS,3)]; ha3.Y = [6 6];
            text(double(sum_PPM(PPMsinyalMS,3))-1.1, 5.5, sprintf('PPM3=%i',PPMsinyal(3)));
            else if (zaman >= 0.75*stopTime && zaman < stopTime)
                ha4 = annotation('doublearrow'); ha4.Parent = gca; ha4.X = [sum_PPM(PPMsinyalMS,3) sum_PPM(PPMsinyalMS,4)]; ha4.Y = [6 6];
                text(double(sum_PPM(PPMsinyalMS,4))-1.1, 6.5, sprintf('PPM4=%i',PPMsinyal(4)));
                else
                    ha1 = annotation('doublearrow'); ha1.Parent = gca; ha1.X = [0 PPMsinyalMS(1)]; ha1.Y = [6 6];
                    text(double(PPMsinyalMS(1)-1.1), 5.5, sprintf('PPM1=%i',PPMsinyal(1)));
                    ha2 = annotation('doublearrow'); ha2.Parent = gca; ha2.X = [PPMsinyalMS(1) sum_PPM(PPMsinyalMS,2)]; ha2.Y = [6 6];
                    text(double(sum_PPM(PPMsinyalMS,2))-1.1, 6.5, sprintf('PPM2=%i',PPMsinyal(2)));
                    ha3 = annotation('doublearrow'); ha3.Parent = gca; ha3.X = [sum_PPM(PPMsinyalMS,2) sum_PPM(PPMsinyalMS,3)]; ha3.Y = [6 6];
                    text(double(sum_PPM(PPMsinyalMS,3))-1.1, 5.5, sprintf('PPM3=%i',PPMsinyal(3)));
                    ha4 = annotation('doublearrow'); ha4.Parent = gca; ha4.X = [sum_PPM(PPMsinyalMS,3) sum_PPM(PPMsinyalMS,4)]; ha4.Y = [6 6];
                    text(double(sum_PPM(PPMsinyalMS,4))-1.1, 6.5, sprintf('PPM4=%i',PPMsinyal(4)));
                end
        end
    end
end
% ha2 = annotation('doublearrow'); ha2.Parent = gca; ha2.X = [PPMsinyalMS(1) sum_PPM(PPMsinyalMS,2)]; ha2.Y = [6.5 6.5];   
% ha3 = annotation('doublearrow'); ha3.Parent = gca; ha3.X = [sum_PPM(PPMsinyalMS,2) sum_PPM(PPMsinyalMS,3)]; ha3.Y = [6.5 6.5];   

% ha.LineWidth  = 3;          % make the arrow bolder for the picture
% ha.HeadWidth  = 30;
% ha.HeadLength = 30;
end