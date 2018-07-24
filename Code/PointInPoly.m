function Temp=PointInPoly(Vertices,Point)
% Vertices=[0 0;1 0;1 1;0 1];
% Point=[1.95 .9];
Point_end=[max(Vertices(:,1))+1,Point(2)];
Temp=-1;
counter=0;
if min(Vertices(:,1))<Point(1)|| max(Vertices(:,1))>Point(1)||min(Vertices(:,2)')<Point(2)||max(Vertices(:,2)')>Point(1)
    for ii=1:size(Vertices,1)

        if ii~=size(Vertices,1)
            jj=ii;
            kk=ii+1;
        else 
            jj=ii;
            kk=1;  
        end
        if det([Vertices(jj,1),Vertices(jj,2),1;Vertices(kk,1),Vertices(kk,2),1;Point(1) Point(2) 1])==0
            Temp=0;
            break;
        else
            t1=det([Vertices(jj,1),Vertices(jj,2),1;Vertices(kk,1),Vertices(kk,2),1;Point(1) Point(2) 1]);
            t2=det([Vertices(jj,1),Vertices(jj,2),1;Vertices(kk,1),Vertices(kk,2),1;Point_end(1) Point_end(2) 1]);
            p1=det([Point(1),Point(2),1;Point_end(1),Point_end(2),1;Vertices(jj,1) Vertices(jj,2) 1]);
            p2=det([Point(1),Point(2),1;Point_end(1),Point_end(2),1;Vertices(kk,1) Vertices(kk,2) 1]);
        end
        if t1*t2<0&&p1*p2<0
            counter=counter+1;
        end    
    end
end
if (counter==0 || rem(counter,2)==0) &&Temp~=0
    Temp=-1;
elseif rem(counter,2)~=0 && Temp~=0
    Temp = 1;
end
    
