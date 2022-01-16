set(0,'defaultFigureColor',[1 1 1]);
clear all; clc;

% Use the following external package at Matlab Central: 
%%
% <http://www.mathworks.com/matlabcentral/fileexchange/10656-data-space-to-figure-units-conversion/content/ds2nfu.m http://www.mathworks.com/matlabcentral/fileexchange/10656-data-space-to-figure-units-conversion/content/ds2nfu.m>
%addpath([pwd '\ds2nfu']);

isVideOn = 0;      % To control whether to dump jpeg snapshots or not. 0: do not dump 1: dump jpegs

Np = 220;            % Number of spatial points
dx = 2*pi/Np;        % discretization size 
x  = 0:dx:(6*pi);    % utilized x range

% Individual Harmonics
A=4;
f1sin = A*sin(x)/pi;        f1cos = A*cos(x)/pi;
f2sin = A*sin(3*x)/(3*pi);  f2cos = A*cos(3*x)/(3*pi);
f3sin = A*sin(5*x)/(5*pi);  f3cos = A*cos(5*x)/(5*pi);
f4sin = A*sin(7*x)/(7*pi);  f4cos = A*cos(7*x)/(7*pi);
f5sin = A*sin(9*x)/(9*pi);  f5cos = A*cos(9*x)/(9*pi);

%%
% Overall signal (square wave to be synthesized)
%
% $$f(x)=A\frac{sin(x)}{\pi} + A\frac{sin(3x)}{3\pi} + A\frac{sin(5x)}{5\pi} + A\frac{sin(7x)}{7\pi} $$
%
f=f1sin+f2sin+f3sin+f4sin+f5sin;

Nt = 100;                % Number of points over the circles
dtheta = 2*pi/Nt;        % Discretization over circles
theta  = 0:dtheta:2*pi;  % Span the whole 2pi

% Circle points
x1=A/pi*cos(theta);
y1=A/pi*sin(theta);

x2=A/(3*pi)*cos(3*theta);
y2=A/(3*pi)*sin(3*theta);

x3=A/(5*pi)*cos(5*theta);
y3=A/(5*pi)*sin(5*theta);

x4=A/(7*pi)*cos(7*theta);
y4=A/(7*pi)*sin(7*theta);

Lx=length(x);
Lw=2; Fs=12;


%% First Part: Just shows individual circles and corresponding sinusoids
for i=1:length(x)
    
    %disp([num2str(i) ' of ' num2str(Lx)])
    f1=figure (2); clf; 
    
    sp1=subplot(1,2,1);
    %  -- 1st harmonic ---
    plot(x1,y1,'LineWidth',Lw,'Color','b'); hold on; grid on;
    line([0 f1cos(i)],[0 f1sin(i)],'Color','b','LineWidth',Lw,'LineSmoothing','on');

    set(sp1,'Position',[0.0400    0.1800    0.4    0.677]);
    xlim([-2.5 2.5]); ylim([-2.5 2.5])    
    
    [xf1, yf1] = ds2nfu(sp1,f1cos(i),f1sin(i));     % Convert axes coordinates to figure coordinates for 1st axes
    line(f1cos(i),f1sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','b','color','b')    
    
    %  -- 2nd harmonic ---
    plot(x2,y2,'LineWidth',Lw,'Color','r'); hold on;
    line([0 f2cos(i)],[0 f2sin(i)],'Color','r','LineWidth',Lw,'LineSmoothing','on');
    line(f2cos(i),f2sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','r','color','r')    
    
    [xf2, yf2] = ds2nfu(f2cos(i),f2sin(i));     % Convert axes coordinates to figure coordinates for 1st axes
  
    %  -- 3rd harmonic ---
    plot(x3,y3,'LineWidth',Lw,'Color','g'); hold on;
    line([0 f3cos(i)],[0 f3sin(i)],'Color','g','LineWidth',Lw,'LineSmoothing','on');
    line(f3cos(i),f3sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','g','color','g')    
    
    [xf3, yf3] = ds2nfu(f3cos(i),f3sin(i));     % Convert axes coordinates to figure coordinates for 1st axes
    
    
    title('Harmonic Circles','FontSize',Fs,'FontName','Century Gothic')    
    set(gca,'FontSize',Fs,'FontName','Century Gothic'); %'Aharoni'); 
    
    sp2=subplot(1,2,2);
    %  -- 1st harmonic ---
    plot(x(1:i),f1sin(1:i),'LineWidth',Lw,'Color','b'); hold on; grid on;

    ylim([-2.5 2.5]); xlim([0 19])
    set(sp2,'Position',[0.48    0.178200    0.49    0.680]);

    % Convert axes coordinates to figure coordinates for 1st axes
    [xg1, yg1] = ds2nfu(x(i),f1sin(i));
    annotation('line',[xf1 xg1],[yf1 yg1],'color','b','LineStyle','--','LineWidth',Lw);
    
    %  -- 2nd harmonic ---
    plot(sp2,x(1:i),f2sin(1:i),'g','LineWidth',Lw,'Color','r'); hold on; grid on;

    [xg2, yg2] = ds2nfu(x(i),f2sin(i)); % Convert axes coordinates to figure coordinates for 1st axes
    annotation('line',[xf2 xg2],[yf2 yg2],'color','r','LineStyle','--','LineWidth',Lw);

    %  -- 3rd harmonic ---
    plot(x(1:i),f3sin(1:i),'k','LineWidth',Lw,'Color','g'); hold on; grid on;

    [xg3, yg3] = ds2nfu(x(i),f3sin(i)); % Convert axes coordinates to figure coordinates for 1st axes
    annotation('line',[xf3 xg3],[yf3 yg3],'color','g','LineStyle','--','LineWidth',Lw);

    line(x(i),f1sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','b','color','b')    
    line(x(i),f2sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','r','color','r')
    line(x(i),f3sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','g','color','g')    
    
    title('Harmonics','FontSize',Fs,'FontName','Century Gothic')
    legend('4sin(x)/\pi','4sin(3x)/3\pi','4sin(5x)/5\pi'); 
    xlabel('x','FontSize',Fs,'FontName','Century Gothic')

    set(gca,'FontSize',Fs,'FontName','Century Gothic'); %'Aharoni'); 
    % ---------------------------------------------------------------------
 
    
    if (isVideOn == 1)
        set(gcf,'PaperPositionMode','auto');
        
        FolderName='JPEG';
        mkdir(FolderName)
        Name=[FolderName '/Animation_'];
        itx=i;
%         disp(['itx= ' num2str(itx)]);
        if (itx <10)
            print (f1, '-djpeg100', [Name '000' num2str(itx) '.jpg'],'-r96')
        elseif (itx>=10 && itx <100)
            print (f1, '-djpeg100', [Name '00' num2str(itx) '.jpg'],'-r96')
        elseif (itx>=100 && itx <1000)
            print (f1, '-djpeg100', [Name '0' num2str(itx) '.jpg'],'-r96')
        else
            print (f1, '-djpeg100', [Name '' num2str(itx) '.jpg'],'-r96')
        end
    end
    
    
%    pause(0.001);
end


%% Second Part : Combine all the harmonics and get the square wave synthesis
shift = length(x);  % This is just to save the jpeg with continuing numbers 
itx= 0+ shift;      % which is later used for video generation

for i=1:length(x)
    
%     disp([num2str(i) ' of ' num2str(Lx)])
    f1=figure (2); clf; 
    
    sp1=subplot(1,2,1);
    %  -- 1st harmonic ---
    plot(x1,y1,'LineWidth',Lw,'Color','b'); hold on; grid on;
    line([0 f1cos(i)],[0 f1sin(i)],'Color','b','LineWidth',Lw,'LineSmoothing','on');

    set(sp1,'Position',[0.0400    0.1800    0.4    0.677]);
    xlim([-2.5 2.5]); ylim([-2.5 2.5])    
    

    [xf1, yf1] = ds2nfu(sp1,f1cos(i),f1sin(i));     % Convert axes coordinates to figure coordinates for 1st axes
    line(f1cos(i),f1sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','b','color','b')    

    %  -- 2nd harmonic ---
    plot(x2+f1cos(i),y2+f1sin(i),'LineWidth',Lw,'Color','r'); hold on;
    line(f1cos(i)+[0 f2cos(i)],f1sin(i)+[0 f2sin(i)],'Color','r','LineWidth',Lw,'LineSmoothing','on');
    [xf2, yf2] = ds2nfu(f1cos(i)+f2cos(i),f1sin(i)+f2sin(i));     % Convert axes coordinates to figure coordinates for 1st axes
    line(f1cos(i)+f2cos(i),f1sin(i)+f2sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','r','color','r')    
   
    %  -- 3rd harmonic ---
    plot(x3+f1cos(i)+f2cos(i),y3+f1sin(i)+f2sin(i),'LineWidth',Lw,'Color','g'); hold on;
    line(f2cos(i)+f1cos(i)+[0 f3cos(i)],f2sin(i)+f1sin(i)+[0 f3sin(i)],'Color','g','LineWidth',Lw,'LineSmoothing','on');
    [xf3, yf3] = ds2nfu(f2cos(i)+f1cos(i)+f3cos(i),f2sin(i)+f1sin(i)+f3sin(i));     % Convert axes coordinates to figure coordinates for 1st axes
    line(f2cos(i)+f1cos(i)+f3cos(i),f2sin(i)+f1sin(i)+f3sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','g','color','g')    
    
    % -- 4th harmonic ---
    plot(x4+f1cos(i)+f2cos(i)+f3cos(i),y4+f1sin(i)+f2sin(i)+f3sin(i),'LineWidth',Lw,'Color','k'); hold on;
    line(f2cos(i)+f1cos(i)+f3cos(i)+[0 f4cos(i)],f2sin(i)+f1sin(i)+f3sin(i)+[0 f4sin(i)],'Color','k','LineWidth',Lw,'LineSmoothing','on');
    [xf4, yf4] = ds2nfu(f2cos(i)+f1cos(i)+f3cos(i)+f4cos(i),f2sin(i)+f1sin(i)+f3sin(i)+f4sin(i));     % Convert axes coordinates to figure coordinates for 1st axes
    line(f2cos(i)+f1cos(i)+f3cos(i)+f4cos(i),f2sin(i)+f1sin(i)+f3sin(i)+f4sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','k','color','k')    

    
    title('Harmonic Circles','FontSize',Fs,'FontName','Century Gothic')
    set(gca,'FontSize',Fs,'FontName','Century Gothic'); %'Aharoni');
    
    sp2=subplot(1,2,2);
    ylim([-2.5 2.5]); xlim([0 19])
    set(sp2,'Position',[0.48    0.178200    0.49    0.680]);

    % Convert axes coordinates to figure coordinates for 1st axes
    %  -- 1st harmonic ---
    [xg1, yg1] = ds2nfu(x(i),f1sin(i));
    
    %  -- 2nd harmonic ---
    [xg2, yg2] = ds2nfu(x(i),f2sin(i)); % Convert axes coordinates to figure coordinates for 1st axes

    %  -- 3rd harmonic ---
    [xg3, yg3] = ds2nfu(x(i),f3sin(i)); % Convert axes coordinates to figure coordinates for 1st axes
    
    % -- 4th harmonic ---
    [xg4, yg4] = ds2nfu(x(i),f4sin(i)); % Convert axes coordinates to figure coordinates for 1st axes
    


    plot(x(1:i),f1sin(1:i)+f2sin(1:i)+f3sin(1:i)+f4sin(1:i),'m','LineWidth',Lw); hold on; grid on;
    line(x(i),f2sin(i)+f1sin(i)+f3sin(i)+f4sin(i),10,'LineStyle','-','MarkerSize',8,'MarkerFaceColor','k','color','k')    
    
    ylim([-2.5 2.5]); xlim([0 19])
    set(sp2,'Position',[0.48    0.178200    0.49    0.680]);
    
    
    [xgt, ygt] = ds2nfu(x(i),f1sin(i)+f2sin(i)+f3sin(i)+f4sin(i)); % Convert axes coordinates to figure coordinates for 1st axes
    annotation('line',[xf4 xgt],[yf4 ygt],'color','m','LineStyle','--','LineWidth',Lw);

    title('Summation of First Four Harmonics','FontSize',Fs,'FontName','Century Gothic')
    legend('4sin(x)/\pi + 4sin(3x)/3\pi + 4sin(5x)/5\pi + 4sin(7x)/7\pi'); 
    xlabel('x','FontSize',Fs,'FontName','Century Gothic')
    
    set(gca,'FontSize',Fs,'FontName','Century Gothic'); %'Aharoni'); 
    % ---------------------------------------------------------------------
 
    
    if (isVideOn == 1)
        set(gcf,'PaperPositionMode','auto');
        
        FolderName='JPEG';
        mkdir(FolderName)
        Name=[FolderName '/Animation_'];
        
%         disp(['itx= ' num2str(itx)]);
        if (itx <10)
            print (f1, '-djpeg100', [Name '000' num2str(itx) '.jpg'],'-r96')
        elseif (itx>=10 && itx <100)
            print (f1, '-djpeg100', [Name '00' num2str(itx) '.jpg'],'-r150')
        elseif (itx>=100 && itx <1000)
            print (f1, '-djpeg100', [Name '0' num2str(itx) '.jpg'],'-r96')
        else
            print (f1, '-djpeg100', [Name '' num2str(itx) '.jpg'],'-r96')
        end
    end
  
    itx=itx+1;
    
    pause(0.01);
end

