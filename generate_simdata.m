function simData = generate_simdata(K)

prop = 1/4;


simData = zeros(K);

% Square
sqsize = K*prop;
xS = randi(K-sqsize);
yS = randi(K-sqsize);

simData(yS:yS+sqsize-1,xS:xS+sqsize-1) = simData(yS:yS+sqsize-1,xS:xS+sqsize-1) + ones(sqsize)*0.33;

% Triangle
trisize = K*prop;
xT = randi(K-trisize);
yT = randi(K-trisize);

simData(yT:yT+trisize-1,xT:xT+trisize-1) = simData(yT:yT+trisize-1,xT:xT+trisize-1) + tril(ones(trisize))*0.33;

% Circle
radius = K*prop/2;
xC = randi(K-radius*2)+radius;
yC = randi(K-radius*2)+radius;

a = -radius:radius;
a = repmat(a,radius*2+1,1);
b = -radius:radius;
b = reshape(b,radius*2+1,1);
b = repmat(b,1,radius*2+1);

simData(yC-radius:yC+radius,xC-radius:xC+radius) = simData(yC-radius:yC+radius,xC-radius:xC+radius) + (sqrt(a.^2+b.^2)<radius)*0.33;

end