% Quiz 2, Question 2

% calling the function
min=input('What should the minimum secret number be? ')
max=input('What should the maximum secret number be? ')
tries = input('How many tries to guess the secret number? ')
secret_num (min,max, tries)

function secret_num(min,max,tries)
num2guess=randi([min max]);

% this function gives the user 5 tries to guess the number passed in
% num2guess = number to guess

fprintf('You have %d attempts to guess the secret number between %d and %d\n',tries,min,max);

for num = 1:1:tries  % loop from 1 to 5 (for each try)

    fprintf('Attempt # %d\n',num);  % telling user the attempt #
    guess = input('Guess :');  % prompting the use for a guess
    
    if guess == num2guess  % checking if guess is correct
    disp('You guessed the secret number!');  % telling the user they are correct
        return  % 'return' from the function as we have finished
    end 
    
    if num == tries  % checking to see if the user if out of attempts
        fprintf('You failed, the secret number was %d\n',num2guess)  % telling the user they are out of tries
        return  % 'return' from the function as we have finished
    end
    
end

end