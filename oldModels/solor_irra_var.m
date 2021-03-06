clc
clear
close all
md_name='solor_model.mdl';
cl='rgbkmc';
srd=linspace(200,1000,5);
for i=1:length(srd)
    srad=srd(i);
    opt=30;
    save pr srad opt
    %open_system('solor_model.mdl')
    sim(md_name)
    %close_system(md_name)
    I=ScopeData.signals(1,1).values;
    V=ScopeData.signals(1,2).values;
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
legend(num2str(srd'))
figure(2)
legend(num2str(srd'))