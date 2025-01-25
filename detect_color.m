%Detecttheredcoloredclothusingcolordetectionandsegmentationalgorithm.

function[highlighted_img]=detect_color(img)
%ConvertRGBimagetoHSVcolorspace
hI = rgb2hsv(img);
hImage1 = hI(:,:,1); % Hue channel 
sImage1=hI(:,:,2);%Saturationchannel 
vImage1 = hI(:,:,3); % Value channel
%DefineHSVthresholdsforred color
hueTL1=0.95;
hueTH1=1.0;
%Lowerrangeforred(around0orcloseto1)
hueTL2 = 0.0; 
hueTH2 = 0.05; % Upper range for red (around 0)
saturationTL=0.6;
saturationTH =1;
%Saturationthresholdtoexcludelow- saturation browns
valueTL=0.2;
valueTH =1;
%Valuethresholdtoignoreverydarkcolors
%Maskfor redcolor
hueMaskRed=(hImage1 >=hueTL1|hImage1 <=hueTH2);%Wrap-aroundforredhue 
saturationMaskRed = (sImage1 >= saturationTL) & (sImage1 <= saturationTH);
valueMaskRed = (vImage1 >= valueTL) & (vImage1 <= valueTH);
redObjectsMask=hueMaskRed&saturationMaskRed&valueMaskRed;


% Apply morphological operations to clean up the mask 
redObjectsMask = imfill(redObjectsMask, 'holes');
redObjectsMask = bwmorph(redObjectsMask, 'erode', 2); 
redObjectsMask=bwmorph(redObjectsMask,'dilate',3);
redObjectsMask = imfill(redObjectsMask, 'holes');
% Overlay the mask on the original image
highlighted_img=imoverlay(img,redObjectsMask);

end