function graph=graphing_error(noise_array,pad_array,simData)
figure(); hold on
text=strsplit(num2str(noise_array*100));
for i=1:length(noise_array)
        sim_fourier = ft2(simData);
        im_noisy = addnoise(sim_fourier, noise_array(i));
    for k=1:length(pad_array)
        signal_pad = signal_limited(im_noisy, pad_array(k));
        inv_fourier = ift2(signal_pad);
        Error(k)=error_measure(simData,inv_fourier);
    end
   
    graph=plot(pad_array,Error);
    xlabel('Fraction of image made visible');
    ylabel('Error');

end
lgd=legend({text{1:length(text)}},'Location','north');
title(lgd,'Percentage of noise');
hold off
return 


    


        
        