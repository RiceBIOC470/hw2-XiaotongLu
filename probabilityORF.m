function Pro=probabilityORF(N,N_ORF)
for xx=1:1000
dnaseq=randdnaseq(N);
Dnaseq=upper(dnaseq);
startcodon=strfind(Dnaseq,'ATG');
stopcodon=[strfind(Dnaseq,'TAA'),strfind(Dnaseq,'TAG'),strfind(Dnaseq,'TGA')];
firststopcodon=zeros(1,length(startcodon));
for ii=1:length(startcodon)%do the circulation to every startcodon and start the next criculation until find the nearest stopcodon for the 1st startcodon. 
    ORFlen=stopcodon-startcodon(ii);%find all ORF and store in one array %use all stopcodon to minus every startcodon one by one
    good_length=1e8;
    good_index=0;
    for jj=1:length(ORFlen)
        if ORFlen(jj)>0&&mod(ORFlen(jj),3)==0&&ORFlen(jj)<good_length
            good_length=ORFlen(jj);%find all proper ORF
            good_index=jj;%number for every startcodon
        end
    end
    if good_index>0
        firststopcodon(ii)=stopcodon(good_index);%length(ORFlen)=length(stopcodon) %not place the ORF in order so the ORF will be a stopcodon corresponding to the startcodon
    else
        firststopcodon(ii)=startcodon(ii);
    end
end
ORFsize=firststopcodon-startcodon+3;
ORFgood=ORFsize(ORFsize>N_ORF);
Length=length(ORFgood);
xx=xx+1;
end
Pro=Length/1000;
    
    

function randomSeq = randdnaseq(N)
% returns a random dna sequence of length N
ii=['A','T','G','C'];
num=randi(4,1,N);
randomSeq=ii(num);
