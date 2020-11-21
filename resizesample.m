%Oimage=randi([1 5],6,6)
load('Image.mat')
X=6; %�������ؽ��͵ı���



[N,M]=size(Oimage)
Z=max(max(Oimage))
ESmask=zeros(N,M,Z);


for i=1:N
    for j=1:M
        p=1;
        while p <= Z  %��������Ĵ�С�����ж����ĸ���
            if Oimage(i,j)==p
                ESmask(i,j,p)=1;
        break
            else
                p=p+1;
            end
        end
    end
end

n=N/X;
m=M/X;
seg1=X*ones(1,n);
seg2=X*ones(1,m);
for k=1:Z
partmat(:,:,k)=mat2cell(ESmask(:,:,k),seg1,seg2);
res(:,:,k)=cellfun(@mean,cellfun(@mean,partmat(:,:,k),'UniformOutput',false));
end
            