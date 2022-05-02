# Camera Calibrator ![Status](https://img.shields.io/static/v1?style=flat&logo=github&label=status&message=finished&color=red) [![GitHub license](https://img.shields.io/github/license/debOliveira/myCameraCalibrator.svg)](https://github.com/debOliveira/myCameraCalibrator/blob/master/LICENSE) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)  [![GitHub forks](https://img.shields.io/github/forks/debOliveira/myCameraCalibrator.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/debOliveira/myCameraCalibrator/network/) [![GitHub stars](https://img.shields.io/github/stars/debOliveira/myCameraCalibrator.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/debOliveira/myCameraCalibratorn/stargazers/) [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FdebOliveira%2FmyCameraCalibrator&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

This folder provides two interfaces for camera calibration using the [generic camera model](https://ieeexplore.ieee.org/document/1642666) by Kannala and Brandt.

## MATLAB code

Is an adaptation of [Kannala's](https://users.aalto.fi/~kannalj1/calibration/calibration.html) and [Deng's](https://github.com/DengMark/CameraCalibrator) toolbox, correcting some issues with the radial model initial guess. All the configurations are done in [calibrate.m](matlab/calibrate.m). Please adjust the parameters to:

- the wider FOV of the camera (diagonally, e.g.).
- the focal distance is in millimeters.
- `mu` and `mv` are the conversion factors px/mm (can be found in the sensor datasheet).
- the directory name to where the images are located.

## Python code

Is an double verification of the model using fisheye calibration of OpenCV. The code is also configured to use pinhole model (set the flag `useFisheye` to false).

- Change the first cell of the notebook [calibIntrisics](python/calibIntrisics.ipynb) to match the required folder.
- The initial guess is done using the pinhole model, no need to provide further details about the camera.
- Change the values in cell 6 to the values calibrated using the `matlab` code. Sadly this has to be done manually. 

## Note

As this procedure is an optimization algorithm, please realise that the distortions coefficients between `python` and `matlab` codes may differ while the focal length and principal points remain equal. See the undistorted image and look for similar rectified results. 


