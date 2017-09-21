function proteinseq = dna2protein(dnaseq,frame)
proteinseq = [];
load('Condon2AmAcid.mat');%before this step, input the table get from the optimized codefile to matlab and save the amacid column and condon column as string seperately.
N = length(dnaseq);
if frame==1||frame==2||frame==3
N = N-mod(N+1-frame,3);
tempVector = dnaseq(frame:N);
yy = reshape(tempVector,3,(N-frame+1)/3)';
NN = length(AmAcid);
[m,~] = size(yy); % m is number of elements
for jj = 1:m
    condonTmp = yy(jj,:);
    if (strcmp(condonTmp,'TAG') || strcmp(condonTmp,'TGA') || strcmp(condonTmp,'TAA'))
%         status=0;
        break;   
    end
    for ii = 1:NN
        if condonTmp==Condon(ii)
            newElement = AmAcid(ii);
            break;
        end
    end
    proteinseq = [proteinseq newElement];
end
else
    disp('frame is false')
end
end