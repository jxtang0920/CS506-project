%% pre-preocess
data = xlsread('values_location.csv');
data(1,:) = [];
values_2008 = data(:,3);
values_2011 = data(:,11);
values_2018 = data(:,14);
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

%% property value in 2008
colors = {'k.','b.','g.','y.','r.','m.'};
c(:,1) = (values_2008 < 100000).*(~val);
c(:,2) = (values_2008 < 200000).*(values_2008 >= 100000).*(~val);
c(:,3) = (values_2008 < 300000).*(values_2008 >= 200000).*(~val);
c(:,4) = (values_2008 < 400000).*(values_2008 >= 300000).*(~val);
c(:,5) = (values_2008 < 500000).*(values_2008 >= 400000).*(~val);
c(:,6) = (values_2008 >= 500000).*(~val);
figure
hold on
for i = 1:6
    plot(lng(logical(c(:,i))),lat(logical(c(:,i))),colors{i});
end

plot_google_map
title('Property value in 2008 in Revere')
legend('(0,100000)','[100000,200000)','[200000,300000)','[300000,400000)','[400000,500000)','[500000,inf)')

%% property value in 2011
c(:,1) = (values_2011 < 100000).*(~val);
c(:,2) = (values_2011 < 200000).*(values_2011 >= 100000).*(~val);
c(:,3) = (values_2011 < 300000).*(values_2011 >= 200000).*(~val);
c(:,4) = (values_2011 < 400000).*(values_2011 >= 300000).*(~val);
c(:,5) = (values_2011 < 500000).*(values_2011 >= 400000).*(~val);
c(:,6) = (values_2011 >= 500000).*(~val);
figure
hold on
for i = 1:6
    plot(lng(logical(c(:,i))),lat(logical(c(:,i))),colors{i});
end

plot_google_map
title('Property value in 2011 in Revere')
legend('(0,100000)','[100000,200000)','[200000,300000)','[300000,400000)','[400000,500000)','[500000,inf)')

%% property value in 2018
c(:,1) = (values_2018 < 100000).*(~val);
c(:,2) = (values_2018 < 200000).*(values_2018 >= 100000).*(~val);
c(:,3) = (values_2018 < 300000).*(values_2018 >= 200000).*(~val);
c(:,4) = (values_2018 < 400000).*(values_2018 >= 300000).*(~val);
c(:,5) = (values_2018 < 500000).*(values_2018 >= 400000).*(~val);
c(:,6) = (values_2018 >= 500000).*(~val);
figure
hold on
for i = 1:6
    plot(lng(logical(c(:,i))),lat(logical(c(:,i))),colors{i});
end

plot_google_map
title('Property value of 2018 in Revere')
legend('(0,100000)','[100000,200000)','[200000,300000)','[300000,400000)','[400000,500000)','[500000,inf)')
