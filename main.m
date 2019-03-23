clear
clc
close all
clear global

global m n OB RANSAC
%--------------------------------------
%file_name = '2019-02-04_15_35_19.csv';   % prediction is wrong
%file_name = '2019-02-04_19_56_48.csv';  % 2 gates
file_name = '2019-02-13_20_57_47.csv';  % overshoot in 2nd gate
%--------------------------------------
import_data(file_name);
% [RANSAC] = import_ransac_data();
% analysis_ransac_file(532);


m = 1;
n = length(OB.TIME);
% 
%   m = 3790;
%   n = 4060;


plot_log();


temp = 1;