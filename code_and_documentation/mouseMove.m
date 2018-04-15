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

function mouseMove (object, eventdata, myFigTargetImage,myTargetImage,myDataBase)
        

      myFigAxes=get(myFigTargetImage,'CurrentAxes');      
      C = get (myFigAxes, 'CurrentPoint');
      C=round(C);
     if C(1,1) >= 1 && C(1,2) >= 1 && C(1,1) <= size(myTargetImage,2) && C(1,2) <= size(myTargetImage,1)
        myColor=[myTargetImage(C(1,2),C(1,1),1),myTargetImage(C(1,2),C(1,1),2),myTargetImage(C(1,2),C(1,1),3)];
        myColor=double(myColor);
        %myFindColour = knnsearch(myDataBase(:,1:3),myColor); % here you can configure the search function and distance metric that you want to use     
        myFindColour = myKnnSearch(myDataBase(:,1:3),myColor);
        myFindValue=myDataBase(myFindColour,4);
        title(myFigAxes,['Value = ',num2str(myFindValue)]);
        xlabel(myFigAxes,['(X,Y) = (', num2str(C(1,1)), ', ',num2str(C(1,2)),')          Color code = (',num2str(myColor(1)),',',num2str(myColor(2)),',',num2str(myColor(3)),')']);
     else
        title(myFigAxes,'mouve cursor inside the image region');
        xlabel(myFigAxes,'mouve cursor inside the image region');
    end