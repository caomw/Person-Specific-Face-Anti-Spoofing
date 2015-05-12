function draw_HTERs_specific_quality(model, Feat_Type, Quality_Type_train, Quality_Type_test, method)
%DRAW_PSPECIFICHTERS Summary of this function goes here
%   Function: draw person-specific HTERs on test set
%   Detailed explanation goes here
%   model: Generic or Person-Specific
%   Feat_Type: feature type
%   method: domain adaptation method

name = {'MsLBP' 'LBP' 'HOG' 'LPQ'};

modelname = '';
for k = 1:length(Feat_Type)
    modelname = strcat(modelname, '_', name{Feat_Type(k)});
end

if strcmp(model, 'Generic')
    load(strcat('GenericPerf_test',modelname, '_', method, '_', Quality_Type_train, '_', Quality_Type_test, '.mat'));    
    plot(Perf.HTERs);
    
    stddev = std(Perf.HTERs);
    disp(strcat('Standard Deviation: ', num2str(stddev)));
    
elseif strcmp(model, 'PSpecific')
    load(strcat('PerSpecPerf_test', modelname, '_', method, '_', Quality_Type_train, '_', Quality_Type_test, '.mat'));
    plot(Perf.HTERs);    
    stddev = std(Perf.HTERs);
    disp(strcat('Standard Deviation: ', num2str(stddev)));
    
end

end

