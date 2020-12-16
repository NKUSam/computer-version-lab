%Q3.2
% image = zeros(100,400,3); %ºÚÉ«
% image = ones(100,400,3); %°×É«
% imshow(image);
image = double(imread('gigi.jpg'));
image = image - 20;
image(1625,640,:)

% imshow(image);