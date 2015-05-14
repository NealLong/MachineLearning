%% Compute Gini Index 
function giniVal = giniVal(lable)
classes = unique(lable);
count=length(lable);
giniVal =1;
for i=1:length(classes)
    ratio=sum(lable==classes(i))/count;
    giniVal = giniVal - ratio^2;
end
end