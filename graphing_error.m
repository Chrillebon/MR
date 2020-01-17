function graph=graphing_error(noise_array,pad_array,simData)
figure(); hold on
for i=1:length(pad_array)
    simPad = signal_limited(simData, pad_array(i));
    sim_fourier = fft2(simPad);
    for k=1:length(noise_array)
        im_noisy = addnoise(sim_fourier, noise_array(k));
        inv_fourier = ifft2(im_noisy);
        Error(k)=error_measure(simData,inv_fourier);
    end
    graph=plot(noise_array,Error);
    xlabel('Noise level');
    ylabel('Error');
end
hold off
return 


    


        
        