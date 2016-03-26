function [result] = sample_gen (original, pixel_size)

%% About :
% This is a module which will read a pixelated grayscale sample image and
% run an n * m matrix and replace n * m portion of image with a pixel on
% resultant grayscale image whose corresponding pixel value will be average
% value of all the pixel of the n * m portion of the portion of original
% image.

%% Program
siz = size (original);

if (mod (siz (1), pixel_size) || mod (siz (2), pixel_size))
    error ('Image size is not multiple of pixel size, Abborting');
end

n = uint32 (siz (1) / pixel_size)
m = uint32 (siz (2) / pixel_size)
result = uint32 (repmat(9, [n, m]));

clearvars m n;

for i = 1 : pixel_size : siz (1) / pixel_size
    for j = 1 : pixel_size : siz (2) / pixel_size
        result (uint32 (i / pixel_size) + 1, ...
            uint32 (j / pixel_size) + 1) = ...
            mean2 (original (i : i + pixel_size, j : j + pixel_size));
    end
end

imshow (result);