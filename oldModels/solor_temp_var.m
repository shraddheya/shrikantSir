clc
clear
close all
md_name='solorModelClean.slx';
cl='rgbkmc';
temp=linspace(0,75,6);
for i=1:length(temp)
    srad=500;
    opt=temp(i);
    save pr srad opt
    %open_system(md_name)
    scope = sim(md_name);
    %close_system(md_name)
    I=scope.ScopeData.signals(1,1).values;
    V=scope.ScopeData.signals(1,2).values;
    figure(1)
    hold on 
    plot(V,I,cl(i))
    grid on
    xlabel('Voltage(V)')
    ylabel('Current(A)')
    figure(2)
    hold on 
    plot(V,V.*I,cl(i))
    grid on
    xlabel('Voltage(V)')
    ylabel('Power(W)')
end
figure(1)
legend(num2str(temp'))
figure(2)
legend(num2str(temp'))
temp=0;%%%change