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

clear all
close all
clc


%% Put here your Inputs
myTargetImage=imread('Sample_Target_Image.jpg');
myColorBarImage=imread('Color_Bar.jpg');
myColorBarImageLowValue=0.123; % 
myColorBarImageHighvalue=102.36;




%%
if size(myTargetImage,3)==size(myColorBarImage,3) && (size(myTargetImage,3)==1 || size(myTargetImage,3)==3)
    if size(myTargetImage,3)==1
        myTargetTemp(:,:,1)=myTargetImage;
        myTargetTemp(:,:,2)=myTargetImage;
        myTargetTemp(:,:,3)=myTargetImage;
        myTargetImage=myTargetTemp;
        
        myColorBarTemp(:,:,1)=myColorBarImage;
        myColorBarTemp(:,:,2)=myColorBarImage;
        myColorBarTemp(:,:,3)=myColorBarImage;        
        myColorBarImage=myColorBarTemp;        
    end
    
    myColorBarImage1D=uint8(mean(myColorBarImage,2));
    myColorBarImageNumberSteps=size(myColorBarImage1D,1);
    myColorBarImageValuesSteps=linspace(myColorBarImageHighvalue,myColorBarImageLowValue,myColorBarImageNumberSteps); % high to low because image starts counting the pixels from top to bottom
    myColorBarImageValuesSteps=myColorBarImageValuesSteps';
    
    myFig01=figure;
    imshow(myColorBarImage)
    myFig01Pos=get(myFig01,'Position');
    set(myFig01,'Position',[50,myFig01Pos(2),myFig01Pos(3),myFig01Pos(4)]);
    myFig01Axes=get(myFig01,'CurrentAxes'); 
    title(myFig01Axes,['Color Bar - higher value:  ',num2str(myColorBarImageHighvalue)]);
    xlabel(myFig01Axes,['Color Bar - lower value:  ',num2str(myColorBarImageLowValue)]);


    
    
    myDataBase=zeros(myColorBarImageNumberSteps,4);
    for i=1:myColorBarImageNumberSteps
        myDataBase(i,1:4)=[double(myColorBarImage1D(i,1,1)),double(myColorBarImage1D(i,1,2)),double(myColorBarImage1D(i,1,3)),myColorBarImageValuesSteps(i,1)];
    end

    myFig02=figure;     
    imshow(myTargetImage);    
    myFig02Pos=get(myFig02,'Position');
    set(myFig02,'Position',[100+myFig01Pos(3),myFig02Pos(2),myFig02Pos(3),myFig02Pos(4)]);
    set(myFig02, 'WindowButtonMotionFcn', {@mouseMove,myFig02, myTargetImage,myDataBase});

else
    disp('Both images should be RGB or Grayscale !')
end




