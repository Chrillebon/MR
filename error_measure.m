%%Fejlm�l
function Error=error_measure(simData,inv_fourier)
Error=(norm((simData-inv_fourier),'fro'))/norm(simData,'fro');
return


