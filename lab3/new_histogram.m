function can=new_histogram(img)
z=0;                     
ca=zeros(1,256);            

for i=1:length(img(:,1))*length(img(1,:)) %С����������������������100*100
    b=floor(img(i));
    if(b==0)
        z=z+1;         
    else
        ca(b)=ca(b)+1;  
    end
end

 can=[z,ca];






