function [ms,xs]=extractCorners(dirName,squareSize)

% read images
allimage=cast([], 'uint8');
contents = dir(fullfile(dirName, '*.jpg'));
N = length(contents);
for i=1:N
    name = contents(i).name;
    im = imread(strcat(strcat(dirName,'\'),name));
    allimage(:, :, :, i) = im;
end

% detect corners and generate checker board
[imagePoints, boardSize] = detectCheckerboardPoints(allimage);
worldPoints = generateCheckerboardPoints(boardSize, squareSize);
worldPoints = worldPoints-(flip(boardSize)-2)*squareSize/2;


% create arrays and plot images
N = size(imagePoints,3);
for i=1:N
    ms{i} = imagePoints(:,:,i);
    xs{i} = worldPoints;
    figure('Name',contents(i).name,'NumberTitle','off')
    imshow(allimage(:,:,:,i)), hold on
    % plot points
    plot(imagePoints(:,1,i),imagePoints(:,2,i),'ro');
    % plot origin and axis
    plot(imagePoints(1,1,i),imagePoints(1,2,i),'s',...
         'LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','b');
    line([imagePoints(1,1,i) imagePoints(34,1,i)],[imagePoints(1,2,i) imagePoints(34,2,i)],...
         'Color','yellow','LineWidth',3);
    line([imagePoints(1,1,i) imagePoints(3,1,i)],[imagePoints(1,2,i) imagePoints(3,2,i)],...
        'Color','green','LineWidth',3);
end

% visual assertion
userIn = '';
while ~strcmp(userIn,'Y')
    userIn = input('Please validate all corners were identified [Y/N]: ','s');
    if strcmp(userIn,'N')
        break
    end
end

close all
