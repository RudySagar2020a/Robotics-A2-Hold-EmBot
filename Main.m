%% Clear+Prepare Setup

close all
set(0,'DefaultFigureWindowStyle','docked')
view(3);
clear
clc
clf

%% MAIN CLASS FOR EXECUTING CODE

w = 2;
workspace = [-w w -w w -w w];

%generate & Plot table, arm & card holders

getTable();
robot = Kinova;
CH    = getCardHolders;
cards = getCards;

%% Testing RMRC movement

moveCards(Kinova, cards.getpos*transl(-0.4,0,1)*trotz(pi/2));
iQ = Kinova.GetPose;
Pose = iQ(1:3,4);
[qMatrix, steps] = moveDeal(Kinova, transl(Pose)*transl(0,0,0.9), 1.5);

%% 

% rotmatrix = [-1,1,0,0;
%             0,-1,1,0;
%             1,0,1,0;
%             0,0,0,1];
% q = zeros(1,6);
% nextq = robot.model.ikcon(cards.card{1}.base*trotx(-pi/2),q)
% %q_ch1 = [62.2 -69 -98 -69.4 -70 0]*pi/180;
% traj = jtraj(q,nextq,101);
% for i=1:101
%     q = traj(i,:);
%     animate(robot.model,q);
%     pause(.05);
% end

