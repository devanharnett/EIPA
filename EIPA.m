% Devan Harnett
% 100998173 

% ELEC 4700 Harmonic Wave Equation in 2D FD and Modes 

nx = 50; 
ny = 50; 

dx = 1;
dy = 1;
G = sparse(nx*ny,nx*ny); 

map = @(i,j) j + (i-1)*ny; 

for i=1:nx
    for j=1:ny
        n = map(i,j);
        nxm = map(i-1,j);
        nxp = map(i+1,j);
        nym = map(i,j-1);
        nyp = map(i,j+1);
        
        if (i == 1 || i == nx)
            G(n,n) = 1 / dx^2;
        elseif (j == 1 || j == ny)
            G(n,n) = 1 / dy^2;
            
        elseif (i > 10 & i <20 & j > 10 & j <20)
            G(n,n) = -1 / dx^2 + -1 / dy^2;
            G(n,nxm) = 1 / dx^2;
            G(n,nxp) = 1 / dx^2;
            G(n,nym) = 1 / dy^2;
            G(n,nyp) = 1 / dy^2;
        else
            G(n,n) = -2 / dx^2 + -2 / dy^2;
            G(n,nxm) = 1 / dx^2;
            G(n,nxp) = 1 / dx^2;
            G(n,nym) = 1 / dy^2;
            G(n,nyp) = 1 / dy^2;
        end
    end
end
figure(1)
spy(G)

[E,D] = eigs(G,9,'SM');

eigen = diag(D); 
figure(2) 
title 'eigenvalues'
plot(eigen)

PLOT = zeros(nx,ny,9);
for n=1:9
    for i=1:nx
        for j=1:ny
            PLOT(i,j,n) = E(map(i,j),n);
        end
    end
end

figure(3);
hold on;
for n=1:9
    subplot(3,3,n);
    surf(PLOT(:,:,n),'EdgeColor','none','LineStyle','none','FaceLighting','phong');
end