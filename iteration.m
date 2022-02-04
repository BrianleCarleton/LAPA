% Variables for matrix and number of iterations
n  = 100;
nx = 10;
ny = 10;
% declare V matrix that is nx by ny
V = zeros(nx,ny);
vimbox = zeros(nx,ny);

%3 for loops for number of iteration and matrix dimentions
for i = 1:n
    for m = 1:nx 
        for n = 1:ny
            %Boundary Conditions
            % top of the box will contribute a potential 
            if m == 1 
            V(m,n) = 1;
            vimbox(m,n) = 1;
            % bottom of the box will not contribute a potential
            elseif m == nx
            V(m,n) = 0;
            % at the ends there will only be 3 points
            elseif n == 1
                V(m,n) = (V(m+1,n)+V(m-1,n)+V(m,n+1))/3;
            elseif n == ny
                V(m,n) = (V(m+1,n)+V(m-1,n)+V(m,n-1))/3;
            else 
              V(m,n) = (V(m+1,n)+V(m-1,n)+V(m,n+1)+V(m,n-1))/4;
            end
            
            
        end
    end
end
%plot and calculate electric field using the gradient
surf(V)
[Ex,Ey] = gradient(V);
quiver(Ex,Ey)

imboxfilt(vimbox,3)