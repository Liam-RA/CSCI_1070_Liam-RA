Okay, we have a plan A and a Plan B.

Plan A is to try and make a program that analyses the laboratory images at different mins and maxs (color values), then assess the overlap between the motor end plates and acetylcoline. Then categorizes it as either full, partial, or no overlapp. 
    we have data(processed images), finding clusters of overlapping pixels at a certain brightness threeshold.

The top thing is ambitious, and might not have enough time to physically do it.

Plan A pt.2 = Use an image analysis program to automate the task of analysing images.
    this will probably be done by taking a manually proccessed image, determining the threesholds (# of pixels per color(and of each shade)) that the manually processed image has, then replicating that.




Plan B. 

https://archive.ics.uci.edu/dataset/336/chronic+kidney+disease

Null hypothesis: Blood urea will not have any correlation with Chronic Kidney Disease

Alternate Hypothesis: Blood urea will have a correlation with Chronic Kidney Disease

Null: I will individually asses each column on how to deal with nulls, I will explain the logic behind how I dealt with each null value in the project. Basic logic: {categorical: most common categorical value}, {integer or float: mean or median depeding on skew}

Models used: Logisti regression is my first choice, but I will also use trees (and forrest), and maybe SVM 