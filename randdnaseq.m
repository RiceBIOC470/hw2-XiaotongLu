function randomSeq = randdnaseq(N)
% returns a random dna sequence of length N
ii=['A','T','G','C'];
num=randi(4,1,N);
randomSeq=ii(num);
end