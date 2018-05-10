a=xlsread('features_ooc.csv');
lon = a(:,6);
lat = a(:,7);
oo = a(:,8);
n = size(a,1);
n_oo = sum(oo);
fprintf('The owner-occupied rate is %.2f%.\n',n_oo / n * 100);
val1 = zeros(n_oo, 1);
lon1 = zeros(n_oo, 1);
lat1 = zeros(n_oo, 1);

val0 = zeros(n - n_oo, 1);
lon0 = zeros(n - n_oo, 1);
lat0 = zeros(n - n_oo, 1);
j = 1;
k = 1;
for i=1:n
    if oo(i) == 1
        if lat(i) > 42.43 && lon(i) < -71.01
            val1(j) = 1;
        end
        lon1(j) = lon(i);
        lat1(j) = lat(i);
        j = j + 1;
    else
        if lat(i) > 42.43 && lon(i) < -71.01
            val0(k) = 1;
        end
        lon0(k) = lon(i);
        lat0(k) = lat(i);
        k = k + 1;
    end
end
figure
hold on
plot(lon1(~val1),lat1(~val1),'r.','MarkerSize',4)
plot(lon0(~val0),lat0(~val0),'b.','MarkerSize',4)
plot_google_map
title('Property Location Map in Revere')
legend('owner-occupied','not owner-occupied')