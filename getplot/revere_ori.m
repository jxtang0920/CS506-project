a=xlsread('address with location.xlsx');
lon = a(:,2);
lat = a(:,3);
n = size(a,1);
figure
hold on
plot(lon,lat,'r.','MarkerSize',2)
plot_google_map
title('Property Location Map in Revere')