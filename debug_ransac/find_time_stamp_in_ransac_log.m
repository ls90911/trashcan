function [file_id] = find_time_stamp_in_ransac_log(time_stamp)


global RANSAC
sigma = 100;
file_id = 0;
for i = 1:length(RANSAC)
    for j = 1:length(RANSAC{i}.TIME_STAMP)
        if is_equal(RANSAC{i}.TIME_STAMP(j),time_stamp,sigma)
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
