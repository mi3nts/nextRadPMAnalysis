function [] = drawPredictorImportaince(regressionTree,limit,estimator,nodeID)
%GETPREDICTORIMPORTAINCE Summary of this function goes here
%   Detailed explanation goes here

imp = 100*(regressionTree.predictorImportance/sum(regressionTree.predictorImportance));

[sortedImp,isortedImp] = sort(imp,'descend');

   figure_1= figure('Tag','PREDICTOR_IMPORTAINCE_PLOT',...
        'NumberTitle','off',...
        'units','pixels',...   
        'OuterPosition',[0 0 2000 1300],...
        'Name','predictorImportance',...
        'Visible','off'...
    )



barh(imp(isortedImp));hold on ; grid on ;
set(gca,'ydir','reverse');
xlabel('Scaled Importance(%)','FontSize',20);
ylabel('Predictor Rank','FontSize',20);
   % Create title
    Top_Title=strcat(estimator," - Predictor Importance Estimates")
    Middle_Title = strcat("Node " +string(nodeID))
    title({Top_Title;Middle_Title},'FontSize',21);

% title('Predictor Importaince Estimates')
ylim([.5 (20+.5)]);
yticks([1:1:20])
xlim([0 (limit)]);
xticks([0:1:limit])

sortedPredictorLabels= regressionTree.PredictorNames(isortedImp);
    for n = 1:limit
        text(...
            imp(isortedImp(n))+ 0.05,n,...
            strrep(strrep(sortedPredictorLabels(n),"pm2_5","pm2.5"),"_"," "),...
            'FontSize',15 ...
            )
    end
    
        Fig_name = strrep(strcat(strrep(estimator,".","_"),"_Node_",string(nodeID),...
          "_PredictorImportance",'.png')," ","_")
    saveas(figure_1,char(Fig_name));
   
        Fig_name = strrep(strcat(strrep(estimator,".","_"),"_Node_",string(nodeID),...
          "_PredictorImportance",'.fig')," ","_")
    saveas(figure_1,char(Fig_name));
%     
%     print('ScreenSizeFigure','-dpng','-r100')
    
end

