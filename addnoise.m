function im_noisy = addnoise(im_DFT, tau)
if tau >= 0 && tau <= 1
    [m,n] = size(im_DFT); % size of realvalued image
    IND = randperm(m*n,round(m*n*tau));
    mask = zeros(m,n);
    mask(IND) = 1;
    r = randn(m,n); r = r/norm(r,'fro');
    e = mask.*r*norm(im_DFT,'fro');
    im_noisy = im_DFT + e;
elseif tau > 1 && tau <=100
    [m,n] = size(im_DFT); % size of realvalued image
    IND = randperm(m*n,round(m*n*(tau/100)));
    mask = zeros(m,n);
    mask(IND) = 1;
    r = randn(m,n); r = r/norm(r,'fro');
    e = mask.*r*norm(im_DFT,'fro');
    im_noisy = im_DFT + e;
end