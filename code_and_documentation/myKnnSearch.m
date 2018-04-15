%
%
%
%## If you have any question about the code or additional feature request, please contact me:
% ricardomartins112@gmail.com
% ricardo.martins@uc.pt
%
%
% ##Cite this work:
% Ricardo Martins, "MATLAB colour picker and data extractor from colour bar, colour map and heatmap plots", University of Coimbra, October 2016, code available online: http://rmartins.net/demos/matlab-colour-picker-data-extractor-colour-bar-colour-map-heatmap-plots
% 
%
%
% ## myDemo01.m
% Main routine. Use this file to configure and run your experiment.
% variable "myTargetImage": path to the image that you want to explore and pick values using the mouse.
% variable "myColorBarImage": path to the image that you want to use as reference colour bar. Linear scale.
% variable "myColorBarImageLowValue": scalar value representing the lower value of the reference linear colour bar.
% variable "myColorBarImageHighvalue": scalar value representing the higher value of the reference linear colour bar.
% 
% 
%
% ## mouseMove.m
% Routine that is executed every time you mouve the mousse over the target image.
% You can use the custom "myKnnSearch.m", native "knnsearch.m" or other multi-dimensional search criteria. 
% 
% 
% 
% ## myKnnSearch.m
% Routine that is executed to search the nearest colour (Euclidean distance) to the picked pixel in target image and estimate the corresponding colour bar value.
% 
% 
% 
% ## Color_Bar.jpg
% Example of a colour bar. 
% Colour bar should be oriented verticaly and represent a linear scale. Lower value at the bottom. Higher value at the top.
% Colour bar and target image should be both RGB images or grayscale images.
%
%
% 
% ##Sample_Target_Image.jpg
% Example of a target image, which is going to be explored by mouse. 
% Colour bar and target image should be both RGB images or grayscale images.
%
%
%
%

function myFindColour = myKnnSearch(myDataBase,myColor)

    myDistance=zeros(size(myDataBase,1),1);
    
    for i=1:size(myDataBase,1)
        myDistance(i,1)=sqrt((myColor(1,1)-myDataBase(i,1))^2+(myColor(1,2)-myDataBase(i,2))^2+(myColor(1,3)-myDataBase(i,3))^2);
    end
    
    [temp,myFindColour]=min(myDistance);
    myFindColour=myFindColour(1);