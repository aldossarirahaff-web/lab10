
:- use_module(library(readutil)).

% Dataset: usernames and passwords

user("rahaf", "1234").
user("ahmad", "5678").

% Start the login system

login :-
    login_attempt(1).

% Login attempts

login_attempt(Attempt) :-

    write('Enter username: '),
    flush_output,
    read_line_to_string(user_input, Username),

    write('Enter password: '),
    flush_output,
    read_line_to_string(user_input, Password),

    (
        user(Username, Password)
        ->
        writeln('Login Successful')

        ;
        Attempt < 3
        ->
        Remaining is 3 - Attempt,
        format('Login Unsuccessful. You have ~w more attempts.~n',
               [Remaining]),
        NextAttempt is Attempt + 1,
        login_attempt(NextAttempt)

        ;
        writeln('Login Unsuccessful'),
        writeln('Sorry, you exceeded the maximum number of attempts, try again later.')
    ).
