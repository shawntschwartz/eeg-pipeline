% determine cutoff points for (delta/)alpha/theta bands based on peak alpha
% frequency (PAF)

% Based on Babiloni et al 2012 method
% https://www.researchgate.net/post/Does_anyone_knows_how_I_can_quantify_the_individual_alpha_frequency_PAF

function [t_min,t_max,a_min, a_max, ...
    a1_min,a1_max,a2_min,a2_max,a3_min,a3_max] = set_freq_lims(PAF)

% d_min = PAF - 8;
% d_max = PAF - 6;

t_min = PAF - 6;
t_max = PAF - 3;

a1_min = PAF - 4;
a1_max = PAF - 2;

a2_min = PAF - 2;
a2_max = PAF;

a3_min = PAF;
a3_max = PAF + 2;

a_min = a2_min; % leave alpha1 (L1A) as buffer between theta and alpha
a_max = a3_max;

end