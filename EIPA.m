% PA_5
% Connor Warden

close all;clc;clear all;

nx = 50;
ny = 50;

g = sparse(nx*ny, nx*ny);
v = zeros(1, nx*ny);

% for i = 1:(nx^2)
%     for j = 1:(ny^2)
%         g(i,j) = 0;
%         if i == j && (i ~= 1 || i ~= nx^2) 
%             g(i,j) = 1;
%         end
%     end
% end

for i = 1:(nx)
    
    for j = 1:(ny)
        
        n = i + (j-1)*ny;
        
        if i == 1
            
            g(n,:) = 0;
            g(n,n) = 1;  
            
        elseif i == nx
            
            g(n,:) = 0;
            g(n,n) = 1;
            
        elseif j == 1
            
            g(n,:) = 0;
            g(n,n) = 1;
            
        elseif j == ny
            
            g(n,:) = 0;
            g(n,n) = 1;
            
        else
            nxm = i + (j-2)*ny;
            nxp = i + j*ny;
            nym =i-1 + (j-1)*ny;
            nyp = i+1 + (j-1)*ny;
            
            g(n,n) = -4;
            
            if(i>10 && i<20 && j>10 && j<20)
                g(n,n) = -2;
            end
            
            g(n, nxm) = 1;
            g(n, nxp) = 1;
            g(n, nym) = 1;
            g(n, nyp) = 1;
        end   
    end
end

spy(g)

[E,D] = eigs(g, 9, 'SM');

E1 = reshape(E(:,1), [nx ny]);
E2 = reshape(E(:,1), [nx ny]);
E3 = reshape(E(:,1), [nx ny]);
E4 = reshape(E(:,1), [nx ny]);
E5 = reshape(E(:,1), [nx ny]);
E6 = reshape(E(:,1), [nx ny]);
E7 = reshape(E(:,1), [nx ny]);
E8 = reshape(E(:,1), [nx ny]);
E9 = reshape(E(:,1), [nx ny]);

subplot(3,3,1);
surf(E1);
subplot(3,3,2);
surf(E2);
subplot(3,3,3);
surf(E3);
subplot(3,3,4);
surf(E4);
subplot(3,3,5);
surf(E5);
subplot(3,3,6);
surf(E6);
subplot(3,3,7);
surf(E7);
subplot(3,3,8);
surf(E8);
subplot(3,3,9);
surf(E9);



