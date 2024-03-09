function [x,iter] = SFPI(func,xo,es)

err=100;
iter=0;
stop=1000;
while err>=es && iter<=stop
    iter=iter+1;
    
    % calculate the new g(x) value
    root=func(xo);
    % calculate new error
    err=abs((root-xo)/root*100);
    
    % determine wether to exit the loop or not
    if err <= es
        x=root;
        break
    elseif iter == stop || isnan(err)
        error('the attempt was divergent')
    else
        xo=root;
    end
end

end