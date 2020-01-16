function signal_pad = signal_limited(signal, frac)

signal_pad = signal;

x = size(signal,2);
y = size(signal,1);
w = int32(size(signal,1)*(0.5-frac/2));

% Top
signal_pad(1:w,:) = 0;
% Bottom
signal_pad(y-w:y,:) = 0;
% Left
signal_pad(:,1:w) = 0;
% Right
signal_pad(:,x-w:x) = 0;

end
