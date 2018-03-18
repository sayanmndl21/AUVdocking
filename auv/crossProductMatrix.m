function [cross]=crossProductMatrix(vector)
% crossProductMatrix Computes Cross Product Matrix of 'vector'
% Returns a matrix whose mutiplication to some vector is equivalent to
% cross of 'vector' to the vector. That is for vector [p,q,r],it returns:
%  -          -
% |  0  -r  q  |
% |  r   0  -p |
% |  -q  p  0  |
%  -          -
cross=[0,-vector(3),vector(2);vector(3),0,-vector(1);-vector(2),vector(1),0];
end