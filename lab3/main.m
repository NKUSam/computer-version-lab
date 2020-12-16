%% 图片读入
clear;
clc;
I_B = imread('JR.jpg'); %B:before
I_A = I_B; %A:after


%% RGB转Gray
[height,width, number]=size(I_B);
if number > 1
  I_A = I_B(:,:,1)*0.3+I_B(:,:,2)*0.59+I_B(:,:,3)*0.11;
end
I_TEMP = I_A;
subplot(231)
imshow(I_B) %显示原图
title('original figure');
subplot(232)
imshow(I_A) %显示灰图
title('gray figure')


%% 显示直方图
histogram(I_A,'Histogram of Original Image',3);


%% 求每个Window 的CDF
I_R = uint8(zeros(size(I_A)));
bck_size = [100,100]; %每个块的大小

xreg=ceil(height/bck_size(1)); %x方向的block数目
yreg=ceil(width/bck_size(2));   %y方向的block数目

cdf_set = zeros(xreg,yreg,256); %用来定位
%xreg = 1, yreg = 1 , 1:256
%xreg = 1, yreg = 2 , 1:256
minx=1;  %值是像素                   
maxx=bck_size(1);

for i=1:xreg
    miny=1;                 
    maxy=bck_size(2);
    for j=1:yreg           
        if maxx>height   
            maxx=height;
        end
        if maxy>width
            maxy=width;
        end
        h=new_histogram(I_A(minx:maxx,miny:maxy)); %求小块的直方图矩阵
        for k=1:256
            cdf_set(i,j,k)=sum(h(1:k))/(bck_size(1)*bck_size(2));%求每个像素对应的cdf          
        end

        miny=miny+bck_size(2);                          
        maxy=maxy+bck_size(2);
    end
    minx=minx+bck_size(1);
    maxx=maxx+bck_size(1);
end


%% 使用双线性插值算法算出新图
for i=1:height
    for j=1:width
        bin=I_A(i,j);
 
        x=(i/bck_size(1));    %具体像素位置                
        xl=floor(x);    %块左边             
        xr=xl+1; %块右边                        

        y=(j/bck_size(2)); %具体像素位置
        yt=floor(y);     %块上边                       
        yb=yt+1;    %块下边                             
 
        if(xl<1)
            xl=1;
        end
        if(xr>xreg)
            xr=xreg;                
        end
        if(yt<1)
            yt=1;
        end
        if(yb>yreg)
            yb=yreg;
        end
        
        dxl=x-xl;
        dyt=y-yt;                  
        
        i11=(cdf_set(xl,yt,bin+1));
        i12=(cdf_set(xl,yb,bin+1));       
        i21=(cdf_set(xr,yt,bin+1));
        i22=(cdf_set(xr,yb,bin+1));

        ipv=(1-dxl)*((1-dyt)*i11+dyt*i12)+dxl*((1-dyt)*i21+dyt*i22);  %双线性插值
        
        ipv=uint8(ipv*255);
        
        I_R(i,j)=ipv;
       
    end
end


subplot(234)
imshow(I_R);
title('gray');


%% 将新图转化为彩色图
I_R_L = uint8(zeros(size(I_B)));
for i =1:height
    for j =1:width
        cg = double(I_R(i,j))/double(I_TEMP(i,j));
        I_R_L(i,j,:) = round(cg * I_B(i,j,:));
    end
end

subplot(235)
imshow(I_R_L);
title('recover');

histogram(I_R_L,'Histogram of Original Image',6);

