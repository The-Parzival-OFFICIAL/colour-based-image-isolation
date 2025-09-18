img = imread('hey2.png');
%imshow(img)
hI = rgb2hsv(img);
%imshow(hI)
hImg = hI(:,:,1);
sImg = hI(:,:,2);
vImg = hI(:,:,3);
hueTL1 = 0.029; hueTH1 = 0.98;
saturationTL1 = 0.39; saturationTH1 = 1;
valueTL1 = 0.01; valueTH1 = 1;

% find red color
hueMaskred1 = (hImg <= hueTL1)|(hImg >= hueTH1);
saturationMaskred1 = (sImg >= saturationTL1) & (sImg <= saturationTH1);
valueMaskred1 = (vImg >= valueTL1) & (vImg <= valueTH1);
redObjectsMask1 = hueMaskred1 & saturationMaskred1 & valueMaskred1;
figure
subplot(1,2,1)
imshow(redObjectsMask1);
subplot(1,2,2)
imshow(img);
%pval = impixel(hI);