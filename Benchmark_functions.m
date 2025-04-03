function [VarMin,VarMax,Dim,CostFunction] = Benchmark_functions(F)
switch F
    case 1
        CostFunction = @F1;
        VarMin=-5.12;
        VarMax=5.12;
        Dim=5;
        
    case 2
        CostFunction = @F2;
        VarMin=-10;
        VarMax=10;
        Dim=30;
        
    case 3
        CostFunction = @F3;
        VarMin=-100;
        VarMax=100;
        Dim=30;
        
    case 4
        CostFunction = @F4;
        VarMin=-100;
        VarMax=100;
        Dim=30;
        
    case 5
        CostFunction = @F5;
        VarMin=-30;
        VarMax=30;
        Dim=30;
        
    case 6
        CostFunction = @F6;
        VarMin=-100;
        VarMax=100;
        Dim=30;
        
    case 7
        CostFunction = @F7;
        VarMin=-1.28;
        VarMax=1.28;
        Dim=30;
        
    case 8
        CostFunction = @F8;
        VarMin=-500;
        VarMax=500;
        Dim=30;
        
    case 9
        CostFunction = @F9;
        VarMin=-5.12;
        VarMax=5.12;
        Dim=30;
        
    case 10
        CostFunction = @F10;
        VarMin=-32;
        VarMax=32;
        Dim=30;
        
    case 11
        CostFunction = @F11;
        VarMin=-600;
        VarMax=600;
        Dim=30;
        
    case 12
        CostFunction = @F12;
        VarMin=-50;
        VarMax=50;
        Dim=30;
        
    case 13
        CostFunction = @F13;
        VarMin=-50;
        VarMax=50;
        Dim=30;
        
    case 14
        CostFunction = @F14;
        VarMin=-65.536;
        VarMax=65.536;
        Dim=2;
        
    case 15
        CostFunction = @F15;
        VarMin=-5;
        VarMax=5;
        Dim=4;
        
    case 16
        CostFunction = @F16;
        VarMin=-5;
        VarMax=5;
        Dim=2;
        
    case 17
        CostFunction = @F17;
        VarMin=[-5,0];
        VarMax=[10,15];
        Dim=2;
        
    case 18
        CostFunction = @F18;
        VarMin=-2;
        VarMax=2;
        Dim=2;
        
    case 19
        CostFunction = @F19;
        VarMin=0;
        VarMax=1;
        Dim=3;
        
    case 20
        CostFunction = @F20;
        VarMin=0;
        VarMax=1;
        Dim=6;
        
    case 21
        CostFunction = @F21;
        VarMin=0;
        VarMax=10;
        Dim=4;
        
    case 22
        CostFunction = @F22;
        VarMin=0;
        VarMax=10;
        Dim=4;
        
    case 23
        CostFunction = @F23;
        VarMin=0;
        VarMax=10;
        Dim=4;
end

end

% F1
function Func = F1(x)
Func=sum(x.^2);
end

% F2
function Func = F2(x)
Func=sum(abs(x))+prod(abs(x));
end

% F3
function Func = F3(x)
Dim=size(x,2);
Func=0;
for i=1:Dim
    Func=Func+sum(x(1:i))^2;
end
end

% F4
function Func = F4(x)
Func=max(abs(x));
end

% F5
function Func = F5(x)
Dim=size(x,2);
Func=sum(100*(x(2:Dim)-(x(1:Dim-1).^2)).^2+(x(1:Dim-1)-1).^2);
end

% F6
function Func = F6(x)
Func=sum(abs((x+.5)).^2);
end

% F7
function Func = F7(x)
Dim=size(x,2);
Func=sum([1:Dim].*(x.^4))+rand;
end

% F8
function Func = F8(x)
Func=sum(-x.*sin(sqrt(abs(x))));
end

% F9
function Func = F9(x)
Dim=size(x,2);
Func=sum(x.^2-10*cos(2*pi.*x))+10*Dim;
end

% F10
function Func = F10(x)
Dim=size(x,2);
Func=-20*exp(-.2*sqrt(sum(x.^2)/Dim))-exp(sum(cos(2*pi.*x))/Dim)+20+exp(1);
end

% F11
function Func = F11(x)
Dim=size(x,2);
Func=sum(x.^2)/4000-prod(cos(x./sqrt([1:Dim])))+1;
end

% F12
function Func = F12(x)
Dim=size(x,2);
Func=(pi/Dim)*(10*((sin(pi*(1+(x(1)+1)/4)))^2)+sum((((x(1:Dim-1)+1)./4).^2).*...
    (1+10.*((sin(pi.*(1+(x(2:Dim)+1)./4)))).^2))+((x(Dim)+1)/4)^2)+sum(Ufun(x,10,100,4));
end

% F13
function Func = F13(x)
Dim=size(x,2);
Func=.1*((sin(3*pi*x(1)))^2+sum((x(1:Dim-1)-1).^2.*(1+(sin(3.*pi.*x(2:Dim))).^2))+...
    ((x(Dim)-1)^2)*(1+(sin(2*pi*x(Dim)))^2))+sum(Ufun(x,5,100,4));
end

% F14
function Func = F14(x)
aS=[-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32;...
    -32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32];
for j=1:25
    bS(j)=sum((x'-aS(:,j)).^6);
end
Func=(1/500+sum(1./([1:25]+bS))).^(-1);
end

% F15
function Func = F15(x)
aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
bK=[.25 .5 1 2 4 6 8 10 12 14 16];bK=1./bK;
Func=sum((aK-((x(1).*(bK.^2+x(2).*bK))./(bK.^2+x(3).*bK+x(4)))).^2);
end

% F16
function Func = F16(x)
Func=4*(x(1)^2)-2.1*(x(1)^4)+(x(1)^6)/3+x(1)*x(2)-4*(x(2)^2)+4*(x(2)^4);
end

% F17
function Func = F17(x)
Func=(x(2)-(x(1)^2)*5.1/(4*(pi^2))+5/pi*x(1)-6)^2+10*(1-1/(8*pi))*cos(x(1))+10;
end

% F18
function Func = F18(x)
Func=(1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*(x(1)^2)-14*x(2)+6*x(1)*x(2)+3*x(2)^2))*...
    (30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*(x(1)^2)+48*x(2)-36*x(1)*x(2)+27*(x(2)^2)));
end

% F19
function Func = F19(x)
aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
Func=0;
for i=1:4
    Func=Func-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% F20
function Func = F20(x)
aH=[10 3 17 3.5 1.7 8;.05 10 17 .1 8 14;3 3.5 1.7 10 17 8;17 8 .05 10 .1 14];
cH=[1 1.2 3 3.2];
pH=[.1312 .1696 .5569 .0124 .8283 .5886;.2329 .4135 .8307 .3736 .1004 .9991;...
    .2348 .1415 .3522 .2883 .3047 .6650;.4047 .8828 .8732 .5743 .1091 .0381];
Func=0;
for i=1:4
    Func=Func-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% F21
function Func = F21(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];
Func=0;
for i=1:5
    Func=Func-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

% F22
function Func = F22(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

Func=0;
for i=1:7
    Func=Func-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

% F23
function Func = F23(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];
Func=0;
for i=1:10
    Func=Func-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

function Func=Ufun(x,a,k,m)
Func=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end