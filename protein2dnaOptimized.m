function dnaseq=protein2dnaOptimized(AAseq)
load('originalcodon.mat');%before this step, save the condon, AmAcid sequence and the frequency getting from condons table to matlab as string seperately and save them together in a matlab file as originalcodon.mat. 
N = length(Condon);
CondonTemp = Condon(1);
AmAcidTemp = AmAcid(1);
jj = 1;
CondonList =[];
AmAcidList = [];
for ii = 1:N
    if (ii == N)
        for kk = jj:N
            AmAcidList = [AmAcidList;AmAcid(ii)];
            [~,Maxx] = max(freq(jj:ii));
            Max=Maxx+jj-1;
            CondonList = [CondonList;Condon(Max)];
        end
        break;
    end
    if (AmAcid(ii+1) ~= AmAcidTemp)
        for kk = jj:ii
            AmAcidList = [AmAcidList;AmAcid(ii)];
            [~,Maxx]= max(freq(jj:ii));
            Max=Maxx+jj-1;
            CondonList = [CondonList;Condon(Max)];
        end
        jj =  ii+1;
        AmAcidTemp = AmAcid(jj);
    end
end
    CondonList;
    AmAcidList;%save CondonList string and AmAcidList string as new Condon2AmAcidOptimized.mat to matlab.

dnaseq = [];
load('Condon2AmAcidOptimized.mat');
NN = length(AmAcidList);
tempvector=AAseq';
[m,~] = size(tempvector); % m is number of elements
for jj = 1:m
    condonTmp = tempvector(jj,:);
    for ii = 1:NN
        if condonTmp==AmAcidList(ii)
            newElement = CondonList(ii);
            break;
        end
    end
    dnaseq = [dnaseq newElement];
end
end