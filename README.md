# Camera calibrator [![GitHub forks](https://img.shields.io/github/forks/debOliveira/myCameraCalibrator.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/debOliveira/myCameraCalibrator/network/) [![GitHub stars](https://img.shields.io/github/stars/debOliveira/myCameraCalibrator.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/debOliveira/myCameraCalibratorn/stargazers/) [![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FdebOliveira%2FmyCameraCalibrator&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

Camera calibration using the [generic camera model](https://ieeexplore.ieee.org/document/1642666). Adaptation of [Kannala's](https://users.aalto.fi/~kannalj1/calibration/calibration.html) and [Deng's](https://github.com/DengMark/CameraCalibrator) toolbox, correcting the initial guess. 

## Usage

- Configure the parameters and run [calibrate.m](matlab/calibrate.m).
- Change the first cell of the notebook [calibIntrisics](python/calibIntrisics.ipynb) to match your image folder.
- Change the values in cell 6 to the values calibrated using the MATLAB code (1st step). Sadly this has to be done manually.
- Set the flag `useFisheye` to false if you want to use the pinhole model.

## Note

> As this procedure is an optimization algorithm, the distortions coefficients between `python` and `matlab` codes may differ while the focal length and principal points remain equal. 


