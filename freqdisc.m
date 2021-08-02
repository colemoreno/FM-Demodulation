function fd = freqdisc(decimatedsignal,delaysignal)

%DOCUMENTATION
% First the decimatedsignal goes through complex conjugation
% Then to create the delay signal it goes through a for loop and gets a delay
% of one sample (1st sample being 0 from the initialization).
% Then ccx and delaysignal are multiplied and the angle is taken from the
% singal.

ccx = conj(decimatedsignal);

for i = 2:length(decimatedsignal)
   delaysignal(i,1) = decimatedsignal(i-1,1);
end

out = ccx.*delaysignal;
fd = angle(out);
end