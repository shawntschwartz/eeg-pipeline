function [ EEG ] = comp_power_PAF( EEG, band, PAF )
% Compute power based on individual peak alpha freq

[t_min,t_max,a_min, a_max, ...
    a1_min,a1_max,a2_min,a2_max,a3_min,a3_max] = set_freq_lims(PAF);

switch band
    case 'theta'
        band_limits = [t_min t_max];
    case 'alpha'
        band_limits = [a_min a_max];
    case 'alpha1'
        band_limits = [a1_min a1_max];
    case 'alpha2'
        band_limits = [a2_min a2_max];
    case 'alpha3'
        band_limits = [a3_min a3_max];
    otherwise
        disp('Unknown band');
        band_limits = nan;
end     
%% set parameters
X = EEG.data; 
fs = EEG.srate; % samps/s
N = EEG.pnts;

%% filter for band
disp(['Filtering for ', band, ...
    ', band limits:', num2str(band_limits(1)),',',num2str(band_limits(2))]);

Xf = channelFilt(X,fs,band_limits(2),band_limits(1));
n = EEG.nbchan;

%% get inst. power
disp('Computing instantaneous power');
Xa = zeros(n,N);
for ch = 1:n
    %Xa(ch,:) = abs(ehilbert(Xf(ch,:)));
    Xa(ch,:) = abs(hilbert(Xf(ch,:)));
end

EEG.data = Xa;
end

