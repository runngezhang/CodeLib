function [predict_label,accuracy] = jdknn(x_train,y_train,x_test,y_test,k,distance,rule)
%%jdknn:packaged knnclassify from Matlab,just for easier use.
%%==============================================================================
%%input:
%%------x_train,...,y_test  :   training and testing sets.                               [required]
%%------k                   :   number of nearest neighbors,default is 5.    [not required]
%%------distance            :   distance metric,choices are:                 [not required]
%%%%-----------euclidean,cityblock,cosine,correlation,Hamming(default is euclidean)
%%------rule                :rules used,choices are:                         [not required]
%%%%-----------nearest,random,consensus(default is nearest)

%%output:
%%------predict_label       :   predicted label vector for test case.
%%------accuracy            :   accuracy
%%==============================================================================
	predict_label = [];
    accuracy = 0;
    k_default = 5;
	distance_default = 'euclidean';
	rule_default = 'nearest';

	k_para = k_default;
	distance_para = distance_default;
	rule_para = rule_default;
    switch nargin
        case 4
            k_para = k_default;
            distance_para = distance_default;
            rule_para = rule_default;
        case 5
            k_para = k;
            distance_para = distance_default;
            rule_para = rule_default;
        case 6
            k_para = k;
            distance_para = distance;
            rule_para = rule_default;
        case 7
            k_para = k;
            distance_para = distance;
            rule_para = rule;
        otherwise
            fprintf('++++++Fatal error!Please check the input!');
            return
	end
	predict_label = knnclassify(x_test,x_train,y_train,k_para,distance_para,rule_para);
	accuracy = mean(predict_label == y_test);
end