# Colour picker and data extractor from colour bar, colour map and heatmap plots


## Description:

- MATLAB tool.

- Colour picker and data extractor from colour bar, colour map and heatmap plots.

- I have used this tool to extract data from figures of scientific papers.

- It can be used as a tool to (preliminary) estimate and evaluate data during systematic reviews and meta-analysis.

# Demonstration:

[![alt text](https://img.youtube.com/vi/RzjkCbxaD24/0.jpg)](https://youtu.be/RzjkCbxaD24)


## Documentation:



- myDemo01.m

  -Main routine. Use this file to configure and run your experiment.

  -variable "myTargetImage": path to the image that you want to explore and pick values using the mouse.

  -variable "myColorBarImage": path to the image that you want to use as reference colour bar. Linear scale.

  -variable "myColorBarImageLowValue": scalar value representing the lower value of the reference linear colour bar.

  -variable "myColorBarImageHighvalue": scalar value representing the higher value of the reference linear colour bar.


- mouseMove.m

Routine that is executed every time you mouve the mousse over the target image.

You can use the custom "myKnnSearch.m", native "knnsearch.m" or other multi-dimensional search criteria.



- myKnnSearch.m

Routine that is executed to search the nearest colour (Euclidean distance) to the picked pixel in target image and estimate the corresponding colour bar value.



- Color_Bar.jpg

Example of a colour bar.

Colour bar should be oriented verticaly and represent a linear scale. Lower value at the bottom. Higher value at the top.

Colour bar and target image should be both RGB images or grayscale images.

Best option to get a good version of a colour bar is to printscreen the source of that colour bar: eg: a scientific paper.



- Sample_Target_Image.jpg

Example of a target image, which is going to be explored by mouse.

Colour bar and target image should be both RGB images or grayscale images.

Best option to get a good version of a target image is to printscreen the source of that target image. eg: a scientific paper.
