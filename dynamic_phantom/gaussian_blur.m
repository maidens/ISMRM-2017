function [blurred_image varargout] = gaussian_blur(original_image,fwhm);
% blurred_image = gaussian_blur(original_image,fwhm) returns a blurred
% verision of the original image. the blurring kernel is gaussian with a
% fullwidth half max given by fwhm


% determine the distance of each pixel in the kernel array from the center
y_dim = size(original_image,1);
x_dim = size(original_image,2);
coordinates_x = [1:x_dim]-x_dim/2;
coordinates_y = [1:y_dim]-y_dim/2;
[x_coordinates y_coordinates] = meshgrid(coordinates_x,coordinates_y);
radii = sqrt(x_coordinates.^2 +y_coordinates.^2);
varargout(2) = {radii};



% define the kernel
kernel = 2*sqrt(log(2)/pi)/fwhm*exp(-4*log(2)*(radii.^2)/fwhm^2);
kernel = kernel/sum(sum(kernel));
varargout(1) = {kernel};

% blurr image
ft_image =  fftn(original_image);
ft_kernel = fftn(kernel);
ft_blur = ft_image.*ft_kernel;
blurred_image = circshift(fftshift(ifftn(ft_blur)),[1 1]);
