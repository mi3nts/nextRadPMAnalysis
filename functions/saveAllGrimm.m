function [] = saveAllGrimm(dataFolder)
%SAVEALLGRIM Summary of this function goes here
%   Detailed explanation goes here

dotMatFolder    = dataFolder + "/dotMats";
grimmDataFolder = dataFolder + "/Spectrometor";
grimmDataAll    = dir(grimmDataFolder)

grimmDataTable  = struct2table(grimmDataAll);
grimmDataWanted = grimmDataTable(endsWith(grimmDataTable.name,'-M.dat'),:);

grimmDataFiles    = string(cell2mat(grimmDataWanted.folder)) +"/"+ string(cell2mat(grimmDataWanted.name));
saveNamesPre      = string(cell2mat(grimmDataWanted.folder)) +"/"+ strrep(string(cell2mat(grimmDataWanted.name)),"dat","mat");
saveNamesDotMat   = strrep(saveNamesPre , "/media/teamlary/Team_Lary_1/gitGubRepos/data/mintsData", dotMatFolder);
  


%% Create Dot Mat Files  
    for n =1 :length(grimmDataFiles)
        grimmData = saveGrimmDaily(grimmDataFiles(n));
        grimmData.Properties.VariableNames = {'dateTime','pm10_grimm','pm2_5_grimm','pm1_grimm','inhalable_grimm','thoracic_grimm','alveolic_grimm'}   ;
        grimmData.dateTime = datetime(grimmData.dateTime, 'Format','MM/dd/yyyy hh:mm:ss Z','TimeZone','UTC');
        mkdir(fileparts(saveNamesDotMat(n)));
        save(char(saveNamesDotMat(n)),'grimmData');
        clear grimmData
    end
    
end

