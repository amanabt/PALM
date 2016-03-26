B = randn(256, 256, 3);

figure;
imshow (B);
while true
    B = randn(256, 256, 3);
    refreshdata;
end