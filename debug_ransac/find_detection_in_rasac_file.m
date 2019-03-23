function [file_id] = find_detection_in_rasac_file(detection)
global RANSAC
sigma = 0.0001;
file_id = 0;
for i = 1:length(RANSAC)
    if i == 2
        temp = 1;
    end
    for j = 1:length(RANSAC{i}.X_PRE)-3
        if is_equal(RANSAC{i}.X_MEAS(j),detection(1),sigma)% && is_equal(RANSAC{i}.X_MEAS(j+1),detection(2),sigma) ...
               % &&  is_equal(RANSAC{i}.X_MEAS(j+2),detection(3),sigma)
            file_id = [file_id i];
            break;
        end
    end
end
end


function equal = is_equal(a,b,sigma)
if abs(a-b) < sigma
   equal = 1;
else
    equal = 0;
end

end