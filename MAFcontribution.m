% Here to calculate the relative MAF contribution
clear;

% Here to load the images
% int525 file is the image acquired at 800nm excitation, 525nm emission
% int460 file is the image acquired at 800nm excitation, 460nm emission
% Both int525 and int460 should be normalized according to laser power and
% gain of detectors, etc., before used for relative MAF contribution calculation
load int525.mat
load int460.mat

% Here to acquire the summed intensity of these two images
I525 = sum(sum(int525));
I460 = sum(sum(int460));

% Here to calculate the C2/C1 ratio
% According to equation (3) in the Methods under the "Image-Based 
% Quantitative Assessment of Mineralization Associated Fluorescence (MAF)"
% section, based on the parameters acquired from calibration and spectra 
% analysis, the calculation of Cratio, expressed as C2/C1, is shown as
% follows:
Eratio = 0.8573;
alpha460 = 0.3394;
alpha525 = 0.3590;
beta460 = 0.0812;
beta525 = 0.3614;
Kai = 0.1520;
Iratio = I460/I525;

Cratio = (Eratio*alpha460-Iratio*alpha525)/(Kai*(Iratio*beta525-Eratio*beta460));

% Finally, we acquire the metric Crationor, which defines as C2/(C2+C1). It
% is metric ranging between 0 and 1, indicative of the relative
% contribution of mineralization associated fluorescence
Crationor = 1/((1/Cratio)+1);