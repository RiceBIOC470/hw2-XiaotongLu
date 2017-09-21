function dnaseq=protein2dna(proteinseq)
dnaseq = [];
load('Condon2AmAcid.mat');%before this step, input the table to matlab and save the amacid column and condon column as string seperately.
NN = length(proteinseq);
tempvector=proteinseq';
[m,~] = size(tempvector); % m is number of elements
for jj = 1:m
    condonTmp = tempvector(jj,:);
    for ii = 1:NN
        if condonTmp==AmAcid(ii)
            newElement = Condon(ii);
            break;
        end
    end
    dnaseq = [dnaseq newElement];
end
end