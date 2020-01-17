function graph=graphing_error(noise_array,pad_array,simData)
figure(); hold on
for i=1:length(noise_array)
        sim_fourier = fft2(simData);
        im_noisy = addnoise(sim_fourier, noise_array(i));
    for k=1:length(pad_array)
        signal_pad = signal_limited(fftshift(im_noisy), pad_array(k));
        inv_fourier = ifft2(ifftshift(signal_pad));
        Error(k)=error_measure(simData,inv_fourier);
    end
    graph=plot(pad_array,Error);
    xlabel('Pad array');
    ylabel('Error');

end
hold off
return 


    


        
        