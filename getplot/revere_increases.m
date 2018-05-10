%% pre-preocess
data = xlsread('values_location.csv');
data(1,:) = [];
values_2008 = data(:,4);
values_2011 = data(:,7);
values_2015 = data(:,11);
values_2018 = data(:,14);
increases_10 = values_2018 - values_2008;
increases_7 = values_2018 - values_2011;
increases_3 = values_2018 - values_2015;
lng = data(:,16);
lat = data(:,17);

j = 1;
n = size(data,1);
val = zeros(n,1);
for i=1:n
    if lat(i) > 42.43 && lng(i) < -71.01
        val(j) = 1;
    end
    j = j + 1;
end


%% property value increases in the past 10 years
colors = linspace(1,20,8);
c = zeros(n, 8);
c(:,1) = (increases_10 < -100000).*(~val);
c(:,2) = (increases_10 < -50000).*(increases_10 >= -100000).*(~val);
c(:,3) = (increases_10 < 0).*(increases_10 >= -50000).*(~val);
c(:,4) = (increases_10 < 50000).*(increases_10 >= 0).*(~val);
c(:,5) = (increases_10 < 100000).*(increases_10 >= 50000).*(~val);
c(:,6) = (increases_10 < 150000).*(increases_10 >= 100000).*(~val);
c(:,7) = (increases_10 < 200000).*(increases_10 >= 150000).*(~val);
c(:,8) = (increases_10 >= 200000).*(~val);
cl = ones(n,1);
figure
hold on
for i = 1:8
    scatter(lng(logical(c(:,i))),lat(logical(c(:,i))),5,colors(i)*cl(logical(c(:,i))),'filled');
end

plot_google_map
title('Property value increases in the past 10 years in Revere')
legend('(-inf,-100000)','[-100000,-50000)','[-50000,0)','[0,50000)','[50000,100000)','[100000,150000)','[150000,200000)','[200000,inf)')
%% property value increases in the past 7 years
c = zeros(n, 8);
c(:,1) = (increases_7 < -100000).*(~val);
c(:,2) = (increases_7 < -50000).*(increases_7 >= -100000).*(~val);
c(:,3) = (increases_7 < 0).*(increases_7 >= -50000).*(~val);
c(:,4) = (increases_7 < 50000).*(increases_7 >= 0).*(~val);
c(:,5) = (increases_7 < 100000).*(increases_7 >= 50000).*(~val);
c(:,6) = (increases_7 < 150000).*(increases_7 >= 100000).*(~val);
c(:,7) = (increases_7 < 200000).*(increases_7 >= 150000).*(~val);
c(:,8) = (increases_7 >= 200000).*(~val);
figure
hold on
for i = 1:8
    scatter(lng(logical(c(:,i))),lat(logical(c(:,i))),5,colors(i)*cl(logical(c(:,i))),'filled');
end

plot_google_map
title('Property value increases in the past 7 years in Revere')
legend('(-inf,-100000)','[-100000,-50000)','[-50000,0)','[0,50000)','[50000,100000)','[100000,150000)','[150000,200000)','[200000,inf)')

%% property value increases in the past 3 years
c = zeros(n, 8);
c(:,1) = (increases_3 < -100000).*(~val);
c(:,2) = (increases_3 < -50000).*(increases_3 >= -100000).*(~val);
c(:,3) = (increases_3 < 0).*(increases_3 >= -50000).*(~val);
c(:,4) = (increases_3 < 50000).*(increases_3 >= 0).*(~val);
c(:,5) = (increases_3 < 100000).*(increases_3 >= 50000).*(~val);
c(:,6) = (increases_3 < 150000).*(increases_3 >= 100000).*(~val);
c(:,7) = (increases_3 < 200000).*(increases_3 >= 150000).*(~val);
c(:,8) = (increases_3 >= 200000).*(~val);
figure
hold on
for i = 1:8
    scatter(lng(logical(c(:,i))),lat(logical(c(:,i))),5,colors(i)*cl(logical(c(:,i))),'filled');
end
plot_google_map
title('Property value increases in the past 3 years in Revere')
legend('(-inf,-100000)','[-100000,-50000)','[-50000,0)','[0,50000)','[50000,100000)','[100000,150000)','[150000,200000)','[200000,inf)')