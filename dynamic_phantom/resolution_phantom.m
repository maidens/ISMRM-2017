%This script will generate a 'resolution', or multi-radius phantom for SAKE
%simulations. Number of circles and locations can be controlled below.

close all, clear all, clc

nx = 64;
ny = 64;

cx = round([0.3 0.5 0.7].*nx);
cy = round([0.3 0.5 0.7].*ny);

im = zeros(64,64);
for x = 1:nx
    for y = 1:ny
        %central circle
        if sqrt((x-cx(2)).^2 + (y-cy(2)).^2) < 5
            im(x,y) = 1;
        else
        end
    end
end


cx = [19 45];
cy = [19 45];

for x = 1:nx
    for y = 1:ny
        for cx_idx = 1:length(cx)
            ctr = 1;
            for cy_idx = 1:length(cy)
                if sqrt((x-cx(cx_idx)).^2 + (y-cy(cy_idx)).^2) < 3
                    im(x,y) = 1;
                else
                end
                ctr = ctr + 1;
            end
        end
    end
end

cx = [19+13 45];
cy = [19+13 45];

for x = 1:nx
    for y = 1:ny
        for cx_idx = 1:length(cx)
            ctr = 1;
            for cy_idx = 1:length(cy)
                if sqrt((x-cx(cx_idx)).^2 + (y-cy(cy_idx)).^2) < 1
                    im(x,y) = 1;
                else
                end
                ctr = ctr + 1;
            end
        end
    end
end

cx = [19 45-13];
cy = [19 45-13];

for x = 1:nx
    for y = 1:ny
        for cx_idx = 1:length(cx)
            ctr = 1;
            for cy_idx = 1:length(cy)
                if sqrt((x-cx(cx_idx)).^2 + (y-cy(cy_idx)).^2) < 1
                    im(x,y) = 1;
                else
                end
                ctr = ctr + 1;
            end
        end
    end
end

im = gaussian_blur(im,2);
figure,imagesc(im)
axis image off

% im_phantom = im; keep im_phantom; save im_phantom.mat

%% Will generate 5 x 5 circles; not suitable for circular compact support
close all, clear all, clc

nx = 64;
ny = 64;
r = 1:5;
pos_low = 0.1.*nx;
pos_high = 0.9.*ny;

cx = round(linspace(pos_low, pos_high,length(r)));
cy = round(linspace(pos_low, pos_high,length(r)));

im = zeros(64,64);
for x = 1:nx
    for y = 1:ny
        for cx_idx = 1:length(cx)
            ctr = 1;
            for cy_idx = 1:length(cy)
                if sqrt((x-cx(cx_idx)).^2 + (y-cy(cy_idx)).^2) < r(ctr)
                    im(x,y) = 1;
                else
                end
                ctr = ctr + 1;
            end
        end
    end
end

im = gaussian_blur(im,2);
figure,imagesc(im)

% im_phantom = im; keep im_phantom; save im_phantom.mat