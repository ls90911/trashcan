function [RANSAC] = import_ransac_data()
global t0
RANSAC = {};
p = 1;
for i = 1:1000
    file_name = sprintf('ransac%06d.txt',i);
    if exist(file_name, 'file') == 2
        data = csvread(file_name);
        RANSAC{p}.LOG_STAMP = data(1:end-1,1);
        RANSAC{p}.TIME = data(1:end-1,2);
        RANSAC{p}.X_PRE = data(1:end-1,3);
        RANSAC{p}.Y_PRE = data(1:end-1,4);
        RANSAC{p}.X_MEAS = data(1:end-1,5);
        RANSAC{p}.Y_MEAS = data(1:end-1,6);
        RANSAC{p}.X_EST = data(1:end-1,7);
        RANSAC{p}.Y_EST = data(1:end-1,8);
        RANSAC{p}.TIME_STAMP = data(1:end-1,9);
        p = p+1;
    end
end

end