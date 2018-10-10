function accuracy = test_accuracy(X, Y, w)
    n = size(X,2);
    correctly_guessed_instances = 0;
    for i = 1: n
        if(sigma(Y(i) * X(:,i)' * w) > 0.5)
            correctly_guessed_instances = correctly_guessed_instances + 1;
        end
    end
    accuracy = correctly_guessed_instances / n;
end