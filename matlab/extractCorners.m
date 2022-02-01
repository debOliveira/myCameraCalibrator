function [ms,xs]=extractCorners(dirName,squareSize)

allimage=cast([], 'uint8');
dirName = 'C:\Users\dbnun\Desktop\myCameraCalibrator\python\camera1';
contents = dir(fullfile(dirName, '*.jpg'));
N = length(contents);
for i=1:N
    name = contents(i).name;
    im = imread(strcat(strcat(dirName,'\'),name));
    allimage(:, :, :, i) = im;
end

[imagePoints, boardSize] = detectCheckerboardPoints(allimage);
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

N = size(imagePoints,3);
for i=1:N
    ms{i} = imagePoints(:,:,i);
    xs{i} = worldPoints;
end