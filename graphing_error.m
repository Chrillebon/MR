function graph=graphing_error(noise_array,pad_array,simData)
figure(); hold on
for i=1:length(noise_array)
    im_noisy = addnoise(fft2(simData), noise_array(i));
    for k=1:length(pad_array)
        simPad = signal_limited(im_noisy, pad_array(k));
        inv_fourier = ifft2(im_noisy);
        Error(k)=error_measure(simData,inv_fourier);
    end
    graph=plot(pad_array,Error);
    xlabel('Pad array');
    ylabel('Error');
end
hold off
return 


    


        
        