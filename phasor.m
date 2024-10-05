function phasor(F)
    rankF = length(F(1,:));
    if rankF == 2
        mag = F(:,1);  
        th = F(:,2) * pi/180;
        Vr = mag .* cos(th);
        Vi = mag .* sin(th);
    elseif rankF == 1
        mag = abs(F); 
        th = angle(F);
        Vr = real(F); 
        Vi = imag(F);
    end
    
    Vscle = 1.2 * max([abs(Vr); abs(Vi)]);
    Z = 1.1547005 * mag / 10;
    x1 = Vr - (Z .* sin(pi/3 - th));
    y1 = Vi - (Z .* cos(pi/3 - th));
    x2 = Vr - (Z .* cos(th - pi/6));
    y2 = Vi - (Z .* sin(th - pi/6));
    
    or = zeros(length(F(:,1)),1);
    Vx = [or Vr]; 
    Vy = [or Vi];
    Ar1x = [x1 Vr]; 
    Ar1y = [y1 Vi];
    Ar2x = [x2 Vr]; 
    Ar2y = [y2 Vi];
    
    Arx = [Ar1x; Ar2x]; 
    Ary = [Ar1y; Ar2y];
    
    h = plot(Vx', Vy', Arx', Ary');
    axis([-Vscle Vscle -Vscle Vscle]);
    grid on;
end
