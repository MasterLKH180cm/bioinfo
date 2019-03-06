type = 'gtca';
Matrix = eye(4);
gap = -0.5;
seq1 = 'gaattcagtta';
seq2 = 'ggatcga';

result = zeros(length(seq1)+1,length(seq2)+1);
result(:,1) = 0:gap:gap*(length(seq1));
result(1,:) = 0:gap:gap*(length(seq2));
[m,n] = size(result);
for i = 2:m
    for j = 2:n
        num = max([result(i-1,j)+gap, result(i,j-1)+gap, result(i-1,j-1) + (seq1(i-1) == seq2(j-1))]);
        result(i,j) = num;
    end
end