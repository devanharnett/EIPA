% Devan Harnett
% 100998173 

% ELEC 4700 Harmonic Wave Equation in 2D FD and Modes 

global C 

C.q_0 = 1.60217653e-19;             % electron charge
C.hb = 1.054571596e-34;             % Dirac constant
C.h = C.hb * 2 * pi;                % Planck constant
C.m_0 = 9.10938215e-31;             % electron mass
C.kb = 1.3806504e-23;               % Boltzmann constant
C.eps_0 = 8.854187817e-12;          % vacuum permittivity
C.mu_0 = 1.2566370614e-6;           % vacuum permeability
C.c = 299792458;                    % speed of light
C.g = 9.80665;                      %metres (32.1740 ft) per s²

nx = 50; 
ny = 50; 

dx = 1;
dy = 1;
G = sparse(nx*ny,nx*ny); 

a = (C.hb^2) /(2* C.m_0);

map = @(i,j) j + (i-1)*ny; 



