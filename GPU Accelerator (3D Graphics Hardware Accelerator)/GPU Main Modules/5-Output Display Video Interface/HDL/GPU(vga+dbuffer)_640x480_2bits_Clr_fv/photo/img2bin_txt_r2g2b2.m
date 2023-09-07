% modified for R5G6B5 format
% this script convert any image into memory initialization file
% in normal text format (binary format)
% we use 24-bit resolution (8r, 8g, 8b)
% so output is given in 3 files (red, green, blue)

% Tested OK

clear; 
% read source image
aa = double(imread('third.png'));
% image_x = double(imread('1ss.png'))/255;
% image_y = double(imread('2ss.png'))/255;
% % image_z = double(imread('4.png'))/255;
% image_1 = (0.5*image_x) + (0.5*image_y);
% aa = 255*image_1;


% reading image size
s = size(aa);
rr = s(1); %rows
cc = s(2); %columns
ts = rr*cc; %total size

% some initializations
red_vec = zeros(ts, 1);
green_vec = zeros(ts, 1);
blue_vec = zeros(ts, 1);

% generating red channel
cnt=1;
for i=1:rr
    for j=1:cc
        red_vec(cnt) = aa(i,j,1);
        cnt = cnt + 1;
    end
end

% generating green channel
cnt=1;
for i=1:rr
    for j=1:cc
        green_vec(cnt) = aa(i,j,2);
        cnt = cnt + 1;
    end
end

% generating blue channel
cnt=1;
for i=1:rr
    for j=1:cc
        blue_vec(cnt) = aa(i,j,3);
        cnt = cnt + 1;
    end
end

% logging into a text file
% searche help for "fprintf" for more details

% logging red channel - 5-bit
fileID = fopen('text_r64x48.txt','w');
for k=1:ts-1
    tt0 = dec2bin(red_vec(k), 8);
    fprintf(fileID,'%2s\r\n',tt0(1:2));
end
tt0 = dec2bin(red_vec(ts), 8);
fprintf(fileID,'%2s',tt0(1:2));
fclose(fileID);

% logging green channel - 6-bit
fileID = fopen('text_g64x48.txt','w');
for k=1:ts-1
    tt1 = dec2bin(green_vec(k), 8);
    fprintf(fileID,'%2s\r\n',tt1(1:2));
end
tt1 = dec2bin(green_vec(ts), 8);
fprintf(fileID,'%2s',tt1(1:2));
fclose(fileID);

% logging blue channel - 5-bit
fileID = fopen('text_b64x48.txt','w');
for k=1:ts-1
    tt2 = dec2bin(blue_vec(k), 8);
    fprintf(fileID,'%2s\r\n',tt2(1:2));
end
tt2 = dec2bin(blue_vec(ts), 8);
fprintf(fileID,'%2s',tt2(1:2));
fclose(fileID);