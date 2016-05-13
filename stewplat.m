%Stewart Platform
clear all
% To easily visualise the effect then angles below 90 work best 

VectorNX = 0;
VectorNY = 0;
VectorNZ = 1;

YawAngle = 10;      %rotation in xy plane
PitchAngle = 20;    %rotation in xz plane
RollAngle = 15;     %rotation in yz plane

TranslateX = 0;
TranslateY = 0;
TranslateZ = 11;

Translate = [TranslateX,TranslateX,TranslateX,TranslateX,TranslateX,TranslateX,TranslateX;
TranslateY,TranslateY,TranslateY,TranslateY,TranslateY,TranslateY,TranslateY;
TranslateZ,TranslateZ,TranslateZ,TranslateZ,TranslateZ,TranslateZ,TranslateZ];

% Matrix of coordinates describing a the leg base mounting points
% When servos are at horizontal (neutral) positions in X, Y, Z space
% Column vectors are points eg first point is X=3.2, Y=-2.3, Z=0
% last point is same as first so lines join up to show complete shape

Base= [3.2,    -2,     -3.6,   -2,     0.3,    3.9,    3.2;
                -2.3,   -3.3,   -1.7,   3.3,    3.9,    0,      -2.3;      
                0,      0,      0,      0,      0,       0,     0];

Platform= [     1,       0.2,   -2.8,	-2.5,	1.7,     2.3,    1;
                -2.6,	-2.8,	0.3,     1.2,     2.2,     1.5,  -2.6;
                0,       0,       0,       0,       0,       0,  0];

PlatformT = Platform+Translate

            
%Add you’re Yaw, Pitch and Roll transformation matrices and then apply them in the correct order to the starting shape to produce a final shape



clf; % clear the figure from last draw

plot(0,0,'o','MarkerSize',5, 'MarkerFaceColor','b');
axis([-5 5 -5 5 -5 15 0 15]);%keep axis dimensions constant

line([5 -5],[0 0],[0 0],'Color','b','LineWidth',1);% draw X axis
line([0 0],[5 -5],[0 0],'Color','b','LineWidth',1);% draw Y axis
line([0 0],[0 0],[5 -5],'Color','b','LineWidth',1);% draw Z axis
xlabel('X axis');
ylabel('Y axis');
zlabel('Z axis');
hold on
grid on

axis on
%Prepare ‘line’ X, Y and Z vectors
StartX = [Base(1,:)];
StartY = [Base(2,:)];
StartZ = [Base(3,:)];


line(StartX,StartY,StartZ,'Color','r','LineWidth',1); 
%line(StartY,StartZ,'Color','r','LineWidth',1); 

StartA = [Platform(1,:)];
StartB = [Platform(2,:)];
StartN = [Platform(3,:)];

line(StartA,StartB,StartN,'Color','g','LineWidth',1); 


TransA = [PlatformT(1,:)];
TransB = [PlatformT(2,:)];
TransN = [PlatformT(3,:)];

line(TransA,TransB,TransN,'Color','y','LineWidth',1);

 %add stuff here to see final shape in the figure window

 view(30,20);%Set initial viewpoint of 3D plot to 30 azimuth and 20 elevation
