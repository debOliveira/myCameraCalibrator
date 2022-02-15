# Camera Calibrator

This folder provides two interfaces for camera calibration using the generic camera model by Kannala and Brandt.

- The Matlab code is an adaptation of Kannala's and Deng's toolbox, correcting some issues with the radial model initial guess.
- The python code is an double verification of the model using fisheye calibration. The code is also configured to use pinhole model (set the flag `useFisheye` to false)
