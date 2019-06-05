close all
clear all
clc

in_image = imread('D:\Xilinx\Vivado\myprj\vision_top\matlab\in_image.png');

out_image = medfilt2(in_image, [3 3]);

figure;

imshow(out_image);
