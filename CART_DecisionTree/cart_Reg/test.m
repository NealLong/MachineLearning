%% CART

clear all
clc

% 导入数据集
%dataSet = load('ex00.txt');
dataSet = load('ex0.txt');

% 画图1
% plot(dataSet(:,1),dataSet(:,2),'.');
% axis([-0.2,1.2,-1.0,2.0]);

% 画图2
% plot(dataSet(:,2),dataSet(:,3),'.');
% axis([-0.2,1.2,-1.0,5.0]);


createTree(dataSet,1,4);
