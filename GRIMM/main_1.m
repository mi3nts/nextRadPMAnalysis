
clc 
clear all
close all 

%% P1 - Specifying Parametors  

% Put all data in one time table with the following headers - dateTime, pm1
%, pm2.5 pm10 

dataFolder      = "/media/teamlary/Team_Lary_1/gitGubRepos/data/mintsData";
dotMatsFolder   = dataFolder    +  "/dotMats";

grimmDataFolder = dataFolder    +  "/Spectrometor";
grimmDotMats    = dotMatsFolder +  "/Spectrometor";

nextRadDataFolder = dataFolder + "/nextRad/"

nodeID          = "GRIMM";



dtSteps = [seconds(10)]  ; 
dmSteps = [minutes(5), minutes(10)]  ; 

startDate  = datetime(2019,02,12) ;
endDate    = datetime(2019,04,11);

%% Collecting Time Tables 

% % saveAllGrimm(dataFolder);
% grimmTT    =  table2timetable(concatDotMatsGrimm(grimmDotMats,startDate,endDate));
% 
% 
% for n=1:length(dtSteps)
% 
%     dt = dtSteps(n)
% 
%     %% Time Averaging Data
%     mints    =  retime(rmmissing(grimmTT)   ,'regular',@nanmean,'TimeStep',dt);
% 
%     eval(strcat("save ",nextRadDataFolder,"mintsNextRad_1_1_from_",string(startDate),"_to_",string(endDate),"_in_",strrep(string(dt)," ","_"),"_Slices_Node_",nodeID))
% 
%     clear mints
% 
% end

%% Code to gain a moving average 
dt = dtSteps(1)

load(strcat(nextRadDataFolder,"mintsNextRad_1_1_from_",string(startDate),"_to_",string(endDate),"_in_",strrep(string(dt)," ","_"),"_Slices_Node_",nodeID))

dmSteps = [minutes(5), minutes(10)]  ;
% mintsMA  = mints;
% %     
% eval(strcat("save mintsNextRad_1_2_from_",string(startDate),"_to_",string(endDate),"_in_",strrep(string(dtSteps(1))," ","_"),"_Moving_Average_Node_",nodeID))

for n=1:1
    maDt    = dmSteps(n)
    dt      = dtSteps(1);
    mintsMA = getMovingAverage(mints,maDt,dtSteps(1));
    eval(strcat("save ",nextRadDataFolder,"mintsNextRad_1_2_from_",string(startDate),"_to_",string(endDate),"_in_",strrep(string(maDt)," ","_"),"_Moving_Averages_for_Node_",nodeID,' mintsMA'))
    clear mintsMA   
    
 end 

%% MSCLNS

% nodeDataFolder = dataFolder+  "/001e06323a06";
% nodeDotMats    =  dotMatsFolder + "/OPCN3";
 
% nodeDataAll    = dir(nodeDataFolder+ "/**/**/*.csv");
% nodeDataTable  = unique(struct2table(nodeDataAll),'rows');
% nodeDataWanted = grimmDataTable(endsWith(nodeDataTable.name,'-M.dat'),:);
 
% OPCN3Data      = nodeDataTable(contains(nodeDataTable.name,"OPCN3"),:);
% OPCN3MintsFiles = getMintsSensorFiles(dataFolder,nodeID,"OPCN3") ;
% 
